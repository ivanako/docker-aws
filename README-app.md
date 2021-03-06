This project will allow you to deploy a containerized application in AWS on a production-grade highly available and secure infrastructure consisting of private and public subnets, NAT gateways, security groups and application load balancers in order to ensure the isolation and resilience of the different components.

The following script will deploy your application in a previously created cluster. You need to run the following commands from a terminal in a Cloud9 environment with enough privileges.
You may also configure the variables so as to customize the setup:
* [AWS configuration](etc/conf.d/aws.conf)
* [APP configuration](etc/conf.d/app.conf)

```BASH 

#########################################################################
./bin/app-init-start.sh                                                 ;
#########################################################################



```



If you are running a BLUE/GREEN deployment the following commands will be useful.

The following command will swap the load balancer so as to point to the BLUE deployment:
```BASH


#########################################################################
./bin/aws-target-blue-start.sh                                          ;
#########################################################################



```

The following command will swap back the load balancer so as to point again to the GREEN deployment:
```BASH


#########################################################################
./bin/aws-target-green-start.sh                                         ;
#########################################################################
