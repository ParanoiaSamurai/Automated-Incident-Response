# Ansible Incident Response Automation

This project automates the incident response process using Ansible to collect logs from Cisco routers, analyze those logs for potential issues, and apply remediation if necessary.

## Project Structure

``` table
Automated Incident Response/
├── hosts
├── playbooks/
│   ├── main.yml
│   ├── collect_logs.yml
│   ├── analyze_alerts.yml
│   └── remediation.yml
├── scripts/
│   └── analyze_alerts.sh
├── ansible.cfg
└── README.md

```

## Setup

- Clone the repository
``` bash
git clone https://github.com/ParanoiaSamurai/automated-incident-response.git
cd automated-incident-response
```
- Configure the host file
``` bash
[routers]                                              
                                                        
host name                         
                                                        
[routers:vars]                                         
                                                        
ansible_user = "username"
ansible_password = "password"                          
ansible_connection = network_cli #type of interface that you want to use                       
ansible_network_os = ios # type of OS the device is using
ansible_port = 22  
```
- Ensure that the script is executable
``` bash
chmod +x analyze_alerts.sh
cp analyze_alerts.sh
```

## Usage
- Run the main.yml file as it will execute all the playbooks out there.

``` bash
ansible-playbook -i inventories/production playbooks/main.yml
```

### That's all is needed, hope you like the repo.
