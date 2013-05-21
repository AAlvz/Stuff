#!/bin/bash
mkdir /home/alfonso/ldap/$1
touch /home/alfonso/ldap/$1/$1.ldif 

echo "objectClass: organizationalUnit
ou: Users

dn: uid=$1, ou=Users,dc=testlab,dc=dev
objectClass: organizationalPerson
objectClass: person
objectClass: top
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: $1
sn: $1
givenName: $1
cn: $1
displayName: $1
uidNumber: 10000
gidNumber: 10000
userPassword: $2
gecos: $1
loginShell: /bin/bash
homeDirectory: /home/alfonso/ldap/$1
mail: $1@hotmail.com
telephoneNumber: 000-000-0000
st: NY
manager: uid=$1,ou=Users,dc=testlab,dc=dev
shadowExpire: -1
shadowFlag: 0
shadowWarning: 7
shadowMin: 8
shadowMax: 999999
shadowLastChange: 10877
title: System Administrator
" > /home/alfonso/ldap/$1/$1.ldif

ldapadd -x -D cn=admin,dc=testlab,dc=dev -w pass -f /home/alfonso/ldap/$1/$1.ldif

