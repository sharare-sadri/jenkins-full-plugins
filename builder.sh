#!/bin/bash

echo "buld new jenkins image"

cd /home/shsadri/jenkins-full-plugins

echo $JENKINS_IMAGE_NAME

sudo docker build -t $JENKINS_IMAGE_NAME .

echo run jenkins image 

echo $JENKINS_CONTAINER_NAME 

echo $JENKINS_HOST_PORT 
 

sudo docker run --rm -d --name $JENKINS_CONTAINER_NAME -p $JENKINS_HOST_PORT:8080  $JENKINS_IMAGE_NAME .

