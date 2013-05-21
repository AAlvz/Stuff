#!/usr/bin/env python
import pika
import sys

connection = pika.BlockingConnection(pika.ConnectionParameters(
        host='localhost'))

channel = connection.channel()

channel.exchange_declare(exchange="diferenciador", type='direct')

#channel.queue_declare(queue='rpc_queue')
result = channel.queue_declare(exclusive=True)
queue_name = result.method.queue

severities = sys.argv[1:]
if not severities:
    print >> sys.stderr, "Usa: %s [fibonacci] [default]" % (sys.argv[0],)
    sys.exit(1)

for severity in severities:
    channel.queue_bind(exchange='diferenciador', queue=queue_name, routing_key=severity)

def fib(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        return fib(n-1) + fib(n-2)

def on_request(ch, method, props, body):
    n = int(body) #Numero
    #severity = str(body) #severity

    print " [.] fib(%s)"  % (n,)
    print "Metodo:%s, Channel:%s, props:%s" % (method, ch, props,)
    response = fib(n)

    ch.basic_publish(exchange='',
                     routing_key=props.reply_to,
                     properties=pika.BasicProperties(correlation_id = \
                                                     props.correlation_id),
                     body=str(response))
    ch.basic_ack(delivery_tag = method.delivery_tag)

channel.basic_qos(prefetch_count=1)
#channel.basic_consume(on_request, queue='rpc_queue')
channel.basic_consume(on_request, queue=queue_name)#, no_ack=True)

print " [x] Awaiting RPC requests"
channel.start_consuming()
