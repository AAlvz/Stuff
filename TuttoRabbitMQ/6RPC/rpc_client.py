#!/usr/bin/env python
import pika
import uuid
import sys

class FibonacciRpcClient(object):
    def __init__(self):
        self.connection = pika.BlockingConnection(pika.ConnectionParameters(
                host='localhost'))

        self.channel = self.connection.channel()
        self.channel.exchange_declare(exchange='diferenciador', type='direct')
        self.severity = sys.argv[1] if len(sys.argv) > 1 else 'default'
        self.message = ' '.join(sys.argv[2:]) or "Este es un mje default"
        result = self.channel.queue_declare(exclusive=True)
        self.callback_queue = result.method.queue

        self.channel.basic_consume(self.on_response, no_ack=True,
                                   queue=self.callback_queue)

    def on_response(self, ch, method, props, body):
        if self.corr_id == props.correlation_id:
            self.response = body

    def call(self, n, severity):
        self.response = None
        self.corr_id = str(uuid.uuid4())
        self.channel.basic_publish(exchange='diferenciador',
                                   #routing_key='rpc_queue',
                                   routing_key=severity,
                                   properties=pika.BasicProperties(
                                         reply_to = self.callback_queue,
                                         correlation_id = self.corr_id,
                                         ),
                                   body=str(n))
        print "El tema es:%s" % (str(self.severity))
        print "El numero es:%d" % (int(n))
        while self.response is None:
            self.connection.process_data_events()
        return int(self.response)

fibonacci_rpc = FibonacciRpcClient()

#print " [x] Requesting fib(30)"
#response = fibonacci_rpc.call(30)
if len(sys.argv) > 1:
    print " [x] Requesting Sev:%s fib(%d)" % (str(sys.argv[1]), int(sys.argv[2]))
    response = fibonacci_rpc.call(int(sys.argv[2]), str(sys.argv[1]))
else:
    print " [x] Requesting Sev..."
    response = fibonacci_rpc.call(1, "default")
#mando llamar fubonacci, primer parametro es el Numero. seg severity
#response = fibonacci_rpc.call(int(sys.argv[2]), str(sys.argv[1]))
print " [.] Got %r" % (response,)
