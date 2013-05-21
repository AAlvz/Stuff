#!/bin/bash
su
ldapsearch -x -LLL -b dc=testlab,dc=dev 'uid=*' uid uidNumber dispalyName gid
echo hola


