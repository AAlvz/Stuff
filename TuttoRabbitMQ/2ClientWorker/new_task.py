#!/usr/bin/env python
import pika
import sys

#Se crea la conexion a local host en este caso.
connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel = connection.channel()

#Se declara la cola. Para ver que exista.
channel.queue_declare(queue='task_queue', durable=True)#Asegura que se mantenga el mensaje si rabbitmq deja de funcionar

message = ' '.join(sys.argv[1:]) or "Hello World!"

#Se crea el exchange por el que pasa el mje buscando el queue y se da el mje en el body.
channel.basic_publish(exchange='', routing_key='task_queue', body=message, properties=pika.BasicProperties(delivery_mode = 2, ))#hace el mje persistene
print " [x] Sent %r" % (message,)

#esto permite que mjes arbitrarios sean enviados desde consola.
#channel.basic_publish(exchange='', routing_key='hello', body=message)
print "[x] Sent %r" % (message,)

connection.close()
