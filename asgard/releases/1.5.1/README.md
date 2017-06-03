Asgard-1.5.1 AMI by Kurian

Asgard is an open-source tool developed by Netflix to facilitate application deployment in AWS. This AMI has the Asgard 1.5.1 pre-installed, including the correct versions of the dependencies Java and Tomcat. Up-to-date details on the product can be obtained from https://github.com/Netflix/asgard.

Features

– The AMI comes pre-installed with Asgard and the dependent tools required to run it.

– After configuring to point to your AWS account, the Asgard service can be brought up using a one-liner command.

How It Works

Asgard depends on AWS services such as auto-scale group, Elastic Load Balancer (ELB) and Amazon Machine Image (AMI). The OS, 3rd party tools, application code and configurations are fully baked into AMI.

An application cluster is provisioned within an auto-scaling group, with the assumption that the nodes spun up in that group are designed to join a cluster or connect to a backend service(s) automatically. It also means that nodes can be retired or added as the need arises.

Every time a deployment is done, a new cluster is stood up with new version of an application AMI. If the the application cluster is tied to an ELB, there is an option to add the newly spun up nodes immediately after they are available or later. The best practice is to add all the new nodes to the ELB first and then remove the nodes built with older version of the application software.

Asgard is a Java application served using Tomcat. The deployments can be configured and run from the Asgard UI. Asgard also offers REST APIs to do the tasks that could be done from the UI.

The access of the Asgard instance spun up using this AMI depends on the IAM role attached to the instance. The configuration details can be found in the Asgard product documentation at  https://github.com/Netflix/asgard and in the sample config file available at /opt/asgard/Config.groovy on the EC2 instance.

Contact us if you require additional help to configure the Asgard instance to use with your AWS accounts at contact@kurianinc.us

Supported Platforms

Click on a platform related link below to start spinning up the EC2 node with pre-installed Asgard.

Asgard-1.5.1 v2 for Debian 8 Linux
Asgard-1.5.1 v2 for RedHat Linux 7.3
Asgard-1.5.1 v2 for Amazon Linux
Asgard-1.5.1 v2 for SUSE Linux 12
Asgard-1.5.1 v2 for Ubuntu Linux
Asgard-1.5.1 v2 for Fedora Linux
Asgard-1.5.1 v2 for CentOS 7
If the OS platform you require is not listed here, contact us, we are open to release custom AMIs per request basis.

Configuration

Create an IAM role that has all the required policies to access various objects in your AWS account that Asgard would manage. Details are documented here https://github.com/Netflix/asgard/wiki/Amazon-IAM-Role-Policies. Granting FullAdminAccess is an alternative.
Spin up the EC2 instance from the Asgard AMI with the IAM role above assigned to it. Open inbound traffic on ports 22 and 8080, these network accesses must be very restrictive and shouldn’t be opened to Internet.
The Asgard UI will be available at http://ASGARD-EC2-INSTANCE:8080. But, this will not be pointing to your AWS accounts yet.
On the UI, check if all the EC2 node types that you need are listed and with correct data. If not, collect the missing data from various sources below:
http://www.ec2instances.info/
http://ec2pricing.iconara.info/
 http://aws.amazon.com/ec2/pricing/
 http://aws.amazon.com/ec2/instance-types/
ssh to the EC2 node as a user depending on the Linux distribution:
“ec2-user” on Amazon Linux, SuSE Linux, and RedHat Linux versions,
“centos” on Cent OS,
“fedora” on Fedora,
“ubuntu” on Ubuntu and
“admin” on Debian
Update /opt/asgard/Config.groovy with your AWS account numbers and names. Also, add/update any missing info about the required EC2 node types. Directions are available in the sample file.
Restart Asgard service:
sudo service asgard restart 
Access the Asgard UI on the browser at http://ASGARD-EC2-INSTANCE:8080
The configuration of the EC2 node and the Java settings depend on the number of objects defined in your AWS account. If you see out-of-memory exceptions in the Asgard or Tomcat log,  consider using a larger EC2 node and fine-tune Java and Tomcat settings based on the recommendations provided at https://github.com/Netflix/asgard

Maintenance and Troubleshooting

Look at the Tomcat log for any startup or run-time issues at /opt/tomcat/logs/catalina.out
For Asgard specific issues look at /opt/tomcat/asgard.log
Look at the troubleshooting section in https://github.com/Netflix/asgard for tips on resolving issues.
Support

Send all the support questions to contact@kurianinc.us. E-Mail based support is available for free to get Asgard up and running for your AWS environment.
Kurian, Inc. does additional customization of Asgard, ports Asgard to other operating systems and provides  Asgard based deployment solutions to our customers. Contact us using the info available at CONTACT  for engaging us on any such projects.

