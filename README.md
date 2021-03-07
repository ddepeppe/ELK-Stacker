# ELK-Stacker
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://github.com/ddepeppe/ELK-Stacker/blob/main/Diagrams/Red%20Team%20Resource%20Group%20with%20ELK%20Stack%20Network.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Ansible playbook file may be used to install only certain pieces of it, such as Filebeat.

  https://github.com/ddepeppe/ELK-Stacker/blob/main/Ansible/install-elk.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.   

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.  By distributing network traffic accross 
multiple servers it increases responsivenss and availability of applications and websites.

Load balcing is presented here: https://github.com/ddepeppe/ELK-Stacker/blob/main/Images/Load%20Balancer.png

Load balancers protect the network and defend against Denial of Service (DoS) attacks by redirecting traffic.  Using a Jumpbox gives access to a user via a secure and 
monitored device.  Jump boxes provide a controlled means of access to a device.  

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs. 

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.8   |     Linux        |
| ELK_VM   | Host     | 10.2.0.4   |     Linux        |  
| Web-1    |Webserver | 10.0.0.9   |     Linux        |
| Web-2    |Webserver | 10.0.0.10  |     Linux        |
| Web-3    |Webserver | 10.0.0.13  |     Linux        |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the load balancer machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
??
??

Machines within the network can only be accessed by the Jump Box (10.0.0.8; 52.188.155.224).


A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes/No              | 10.0.0.1 10.0.0.2    |
|          |                     |                      |
|          |                     |                      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it is easy to replicate the conifguration by executing the playbook.  It is also easy to update and reconfigure if needed.

The playbook implements the following tasks:

      1. Install docker.io
      2. Install python3-pip
      3. Install Docker module
      4. Enble docker service
      5. Increase virtual memory
      6. Download and launch a docker elk container
      
The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/ddepeppe/ELK-Stacker/blob/main/Images/docker%20ps.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines: 
| Web-1    |Webserver | 10.0.0.9   |    
| Web-2    |Webserver | 10.0.0.10  |    
| Web-3    |Webserver | 10.0.0.13  |   

We have installed the following Beats on these machines:
| Web-1    |Webserver | 10.0.0.9   |    
| Web-2    |Webserver | 10.0.0.10  |    
| Web-3    |Webserver | 10.0.0.13  |   

These Beats allow us to collect the following information from each machine:
ELK Stack is three open-source products — Elasticsearch (search engine), Logstash (log aaggregator), and Kibana (visualization tool).  Beats, the forth tool in th estack,  are lightweight agents that are installed on hosts to collect different types of data for forwarding into the stack. Filebeat collects log data ex. activity logs, sign-in logs and audits logs and sends data to the ELK stack for analysis.  Metricbeat collects machine data ex. uptime, CPU, disk and memory utilizaton and sends to the ELK stack as well for anaylsis.

This image shows Filebeat and Metricbeat's roles in the stack. https://github.com/ddepeppe/ELK-Stacker/blob/main/Images/Azure%20Integration%20Architecture.png

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
