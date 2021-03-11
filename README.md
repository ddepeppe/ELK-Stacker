# ELK-Stacker
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![alt text](https://github.com/ddepeppe/ELK-Stacker/blob/main/Diagrams/Red-Team-Resource-Group-ELK-Stack.png "Diagram")

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Ansible playbook file may be used to install only certain pieces of it, such as Filebeat.

  
      ---
         - name: Configure Elk VM with Docker
           hosts: elk
           become: true
           tasks:
        # Use apt module
        - name: Install docker.io
          apt:
          update_cache: yes
          force_apt_get: yes
          name: docker.io
         state: present
        # Use apt module
       - name: Install python3-pip
         apt:
         force_apt_get: yes
         name: python3-pip
         state: present
        # Use pip module (It will default to pip3)
       - name: Install Docker module
         pip:
         name: docker
         state: present
       - name: Enble docker service
         systemd:
         name: docker
         enabled: yes
       # Use command module
       - name: Increase virtual memory
         command: sysctl -w vm.max_map_count=262144
       # Use docker_container module
       - name: Download and launch a docker elk container
         docker_container:
         name: elk
         image: sebp/elk:761
         state: started
         restart_policy: always
         published_ports:
          -  5601:5601
          -  9200:9200
          -  5044:5044
       # Use systemd module
       - name: Enable service docker on boot
         systemd:
         name: docker
         enabled: yes
   

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

![alt text](https://github.com/ddepeppe/ELK-Stacker/blob/main/Images/LoadBalancer.png)

Load balancers protect the network and defend against Denial of Service (DoS) attacks by redirecting traffic.  Using a Jumpbox gives access to a user via a secure and 
monitored device.  Jump boxes provide a controlled means of access to a device.  

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs. 

The configuration details of each machine may be found below.

| Name        | Function          | IP Address                                 | Operating System |
|-------------|-------------------|--------------------------------------------|------------------|
| Jump Box    |Gateway            | Public: 52.188.155.224 Private: 10.0.0.8   |     Linux        |
| ELK_VM      |Monitor/Analytics  | Public: 40.123.43.190 Private: 10.2.0.4    |     Linux        |  
| Red_Team_LB |Load Balancer      | Public: 52.249.187.242 Private: N/A        |      N/A         | 
| Web-1       |Web server         | Public: N/A Private: 10.0.0.9              |     Linux        |
| Web-2       |Web server         | Public: N/A Private:10.0.0.10              |     Linux        |
| Web-3       |Web server         | Public: N/A Private:10.0.0.13              |     Linux        |
 

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the load balancer machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: 10.0.0.9, 10.0.0.10 and 10.0.0.13.

Machines within the network can only be accessed by the Jump Box (10.0.0.8; 52.188.155.224).

A summary of the access policies in place can be found in the table below.

| Name        | Publicly Accessible | Allowed IP Addresses |
|-------------|---------------------|----------------------|
|Jump Box     | Yes (SSH)           | my host machine's IP |
|ELK-VM       | Yes (SSH/HTTP)      | my host machine's IP |
|Red_Team_LB  | Yes (HTTP)          | my host machine's IP |
|Web-1        | No                  |                      |
|Web-2        | No                  |                      |
|Web-3        | No                  |                      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it is easy to replicate the configuration by executing the playbook on theh same or multiple machines.  It is also easy to update and reconfigure if needed.

The playbook implements the following tasks:

      1. Specify a  group of machines
      2. Identify the remote user
      3. Increase the memory
      4. Install docker.io
      5. Install python3-pip
      6. Install Docker module
      7. Enable docker service
           
The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![alt text](https://github.com/ddepeppe/ELK-Stacker/blob/main/Images/docker-ps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines: 
| Name     | Function | IP Address | 
|----------|----------|------------|
| Web-1    |Webserver | 10.0.0.9   |    
| Web-2    |Webserver | 10.0.0.10  |    
| Web-3    |Webserver | 10.0.0.13  |   

We have installed the following Beats (Filebeat and Metricbeat) on these machines: 
| Name     | Function | IP Address | 
|----------|----------|------------|
| Web-1    |Webserver | 10.0.0.9   |    
| Web-2    |Webserver | 10.0.0.10  |    
| Web-3    |Webserver | 10.0.0.13  |   

Beats are lightweight agents that are installed on hosts and collect the following information from each machine (ex. Web-1, Web-2, Web-3).  Data is collected and forwarding into the stack. Filebeat collects log data ex. activity logs, sign-in logs and audits logs and sends data to the ELK stack for analysis.  Metricbeat collects machine data ex. uptime, CPU, disk and memory utilizaton and sends to the ELK stack as well for anaylsis. Kibana is installed on the ELK-VM, and access on the 10.2.0.4 using port 5601.

This image shows Filebeat and Metricbeat's roles in the stack.

![alt text](https://github.com/ddepeppe/ELK-Stacker/blob/main/Images/AzureIntegrationArchitecture.png)

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the  4 playbook files to the docker container /etc/ansible/roles folder.
- Copy the ansible.cfg and hosts files to the /etc/ansible folder.
- Update the ansible.cfg file to include the remote_user set to selected admin name ex. "Admin"
- Update the hosts file to include the IP addresses of the destination machines in secctions: [webservers] and [elk].
- Run the playbook file, and SSH into ELK-VM, then run docker ps to confirm the installation worked as expected.

Playbooks are YAML files and have the extension .yml.  These files are copied the /etc/ansible and /etc/ansible/roles folders and are executed with the command ansible-playbook playbookname.yml

Playbooks include:

    pentest.yml (setup DVWA hosts)
    install-elk.yml (setup ELk-VM)
    filebeat.yml (install filebeat on DVWA hosts)
    metricbeat.yml (install Metricbeat on DVWA hosts)

The "hosts" file is updated to direct Ansible to run the playbook on a specific machine. Specify which machine to install the ELK server on versus which to install Filebeat on by using "webservers" or "elk" in the playbook. 
 
 HOSTS file:
 
    [webservers]
    10.0.0.9 ansible_python_interpreter=/usr/bin/python3
    10.0.0.10 ansible_python_interpreter=/usr/bin/python3
    10.0.0.13 ansible_python_interpreter=/usr/bin/python3

    [elk]
    10.2.0.4 ansible_python_interpreter=/usr/bin/python3


Use the URL to check that the ELK server is running: http://40.123.43.190:5601/app/kibana

Kibana Investigation Results:

-Filebeat Dashboard
![alt text](https://github.com/ddepeppe/ELK-Stacker/blob/main/Images/Filebeat-Dashboard.png)

-Metricbeat Dashboard
![alt text](https://github.com/ddepeppe/ELK-Stacker/blob/main/Images/Metricbeat-Dashboard.png)

-Investigating 404 Errors:
![alt text](https://github.com/ddepeppe/ELK-Stacker/blob/main/Images/KibanaLog404Errors.png)

-Investigationg traffic from specific country:
![alt text](https://github.com/ddepeppe/ELK-Stacker/blob/main/Images/Kibana-Unique-Visitors-India.png)

-Investigate Total Requests and Bytes: 
![alt text](https://github.com/ddepeppe/ELK-Stacker/blob/main/Images/Kibana.png)


Download the playbook files using the command:
    
    curl -OL http://github.com/ddepeppe/ELK-Stacker





