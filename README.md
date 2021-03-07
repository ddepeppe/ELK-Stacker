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

Load balancing is presented here: https://github.com/ddepeppe/ELK-Stacker/blob/main/Images/Load%20Balancer.png

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

Only the load balancer machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: 10.0.0.9, 10.0.0.10 and 10.0.0.13.

Machines within the network can only be accessed by the Jump Box (10.0.0.8; 52.188.155.224).

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes - SSH           | 10.0.0.1 10.0.0.2    |
|          |                     |                      |
|          |                     |                      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it is easy to replicate the conifguration by executing the playbook on theh same or multiple machines.  It is also easy to update and reconfigure if needed.

The playbook implements the following tasks:

      1. Specify a  group of machines and remote user
      2. Increase the memory
      3. Install docker.io
      4. Install python3-pip
      5. Install Docker module
      6. Enable docker service
           
The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/ddepeppe/ELK-Stacker/blob/main/Images/docker%20ps.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines: 
| Web-1    |Webserver | 10.0.0.9   |    
| Web-2    |Webserver | 10.0.0.10  |    
| Web-3    |Webserver | 10.0.0.13  |   

We have installed the following Beats (Filebeat and Metricbeat) on these machines: 
| Web-1    |Webserver | 10.0.0.9   |    
| Web-2    |Webserver | 10.0.0.10  |    
| Web-3    |Webserver | 10.0.0.13  |   

Beats allow us to collect the following information from each machine and lightweight agents that are installed on hosts (ex. web-1, web-2, web-3) to collect different types of data for forwarding into the stack. Filebeat collects log data ex. activity logs, sign-in logs and audits logs and sends data to the ELK stack for analysis.  Metricbeat collects machine data ex. uptime, CPU, disk and memory utilizaton and sends to the ELK stack as well for anaylsis. Kibana is then installed on the ELK-VM, 10.2.0.4.

This image shows Filebeat and Metricbeat's roles in the stack. https://github.com/ddepeppe/ELK-Stacker/blob/main/Images/Azure%20Integration%20Architecture.png

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the ansible.cfg file to /etc/ansible.
- Update the ansible.cfg file to include the remote_user 
- Update the hosts file to include the destination machines ex. webservers and elk.
- Run the playbook, and navigate to http://40.123.43.190:5601/app/kibana to check the installation wokred as expected.

Playbooks are YAML files and have the extension .yml.  These files are copied the /etc/ansible and /etc/ansible/roles folders and are executed with the command ansible-playbook playbookname.yml


Playbooks include:
pentest.yml (setup DVWA hosts)
install-elk.yml (setup ELk-VM)
filebeat-playbook.yml (install filebeat on DVWA hosts)
metricbeat-playbook.yml (install Metricbeat on DVWA hosts)

The "hosts" file is updated to make Ansible run the playbook on a specific machine. Specify which machine to install the ELK server on versus which to install Filebeat on by using "webservers" or "elk" in the playbook. 
 
 HOSTS file: 
-[webservers]
10.0.0.9 ansible_python_interpreter=/usr/bin/python3
10.0.0.10 ansible_python_interpreter=/usr/bin/python3
10.0.0.13 ansible_python_interpreter=/usr/bin/python3

[elk]
10.2.0.4 ansible_python_interpreter=/usr/bin/python3


Use the URL to check that the ELK server is running: http://40.123.43.190:5601/app/kibana

Kibana Investigation Results:
Filebeat Dashboard
https://github.com/ddepeppe/ELK-Stacker/blob/main/Images/Filebeat%20Dashboard.png

Metricbeat Dashboard
https://github.com/ddepeppe/ELK-Stacker/blob/main/Images/Metricbeat%20Dashboard.png

Investigating 404 Errors:
https://github.com/ddepeppe/ELK-Stacker/blob/main/Images/Kibana%20Log%20of%20404%20Errors.png

Investigationg traffic from specific country:
https://github.com/ddepeppe/ELK-Stacker/blob/main/Images/Kibana%20Unique%20Visitors%20India.png


