#!/usr/bin/env python
import pika
import sys

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

#el exchange es el nombre del diferenciador. (X) . se le puede dar el nombre que sea, y es el que reparte los mjes
channel.exchange_declare(exchange='direct_logs', type='direct')

result = channel.queue_declare(exclusive=True)
queue_name = result.method.queue

#severities -> tipo de mensaje que se va a recibir (info, warning, error)
severities = sys.argv[1:]
if not severities:
    print >> sys.stderr, "Usage: %s [info] [warning] [error]" % (sys.argv[0],)
    sys.exit(1)

for severity in severities:
    #manda al queue de manera directa(direct_logs), al queue_name que se creo antes para los direct, y deferencialo por severity (route_key)
    channel.queue_bind(exchange='direct_logs', queue=queue_name, routing_key=severity)

#channel.queue_bind(exchange='direct_logs', queue=queue_name)

print ' [x] Waiting for logs. To exit press CTRL + C'

def callback(ch, method, properties, body):
    print " [x] %r %r" % (method.routing_key, body,)

channel.basic_consume(callback, queue=queue_name, no_ack=True)

channel.start_consuming()
