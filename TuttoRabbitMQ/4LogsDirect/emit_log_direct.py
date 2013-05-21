#!/usr/bin/env python
import pika
import sys

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

#channel.exchange_declare(exchange='logs', type='fanout')
channel.exchange_declare(exchange='direct_logs', type='direct')

#Severity->tipo de mensaje que se manda (info, error, warning)
#message-> el mensaje
severity = sys.argv[1] if len(sys.argv) > 1 else 'info'
message = ' '.join(sys.argv[2:]) or "info: Hello World!"
#channel.basic_publish(exchange='logs', routing_key='', body=message)
channel.basic_publish(exchange='direct_logs', routing_key=severity, body=message)

print " [x] Sent %r:%r" % (severity, message)
connection.close()
