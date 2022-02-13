Implementing Dockerfile for jenkis stack with reuired installed plugins such as docker & ansible to facilitate the proccess of jenkins implementation.

Each time we can edit this Dockerfile to add another plugins on it.

Be carefull to make the persistance volume if you are using it in Kubernetes stack and mount it to the below path: 
/var/jenkins_home

By building new Dockerfile the added plugins will installed in jenkins stack
