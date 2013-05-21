#!/bin/bash

su 

ldapsearch -x -LLL -b dc=testlab,dc=dev 'uid='$1'' uid uidNumber dispalyName gid

