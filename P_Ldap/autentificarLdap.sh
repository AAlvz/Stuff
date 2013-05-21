#!/bin/bash

ldapsearch -x -LLL -b dc=testlab,dc=dev 'uid='$1'' uid uidNumber dispalyName gid

if [ "${S}" == "" ]; then
	echo NO ENCONTRÓ NADA
else
	echo Encontró bien, es ${S}
fi
