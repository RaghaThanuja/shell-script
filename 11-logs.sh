#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"


LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "ERROR: : $2 ....$R FAILED $N"
        exit 1    
    else
        echo "$2 ....$G SUCCESS $N"
    fi    
}

if [ $ID -ne 0 ]
then
    echo "$R ERROR:: Please run this script with access $N"
        exit 1 # you can give other than 0
else
    echo "You are root user"
fi    

yum install mysql -y &>> $LOGFILE

VALIDATE $? "Installing mysql"

yum install git -y &>> $LOGFILE

VALIDATE $? "Installing git"


