#!/usr/bin/env python
import pika
import time

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

channel.queue_declare(queue='task_queue', durable=True)#Asegura que se mantenga el mensaje si rabbitmq deja de funcionar
print ' [*] Waiting for messages. To exit press CTRL+C'

#funcion que manda llamar la libreria pika cuando recibe un mensaje
def callback(ch, method, properties, body):
    print " [x] Recieved %r" % (body,)
    time.sleep( body.count('.') )
    print "[x] Done"
    ch.basic_ack(delivery_tag = method.delivery_tag)#pone el ack del mje y si la conexión cae, manda el mensaje a otro worker. Asi no se pierde el mje aun si la conexion cae

channel.basic_qos(prefetch_count=1)#manda de 1 mje a la vez. hasta que se desocupa otro worker.
channel.basic_consume(callback, queue='task_queue') #, no_ack=True)

channel.start_consuming()
