#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with access"
        exit 1 # you can give other than 0
else
    echo "You are root user"
fi    

yum install mysql -y

if [ $? -ne 0 ]
then
    echo "ERROR: : Installing mysql is failed"
    exit 1    
else
    echo "Installing mysql is success"
fi    
