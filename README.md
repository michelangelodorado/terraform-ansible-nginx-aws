# tf-ansible-nginx

## Setting up Terraform for an AWS instance (Ubuntu) and installing NGINX can be done step-by-step as follows:


Step 1: Create AWS Instance with Terraform

```
brew install terraform
```

Before proceeding with Ansible, create your AWS instance using Terraform. Execute the following commands to set up the AWS instance:

```
export AWS_ACCESS_KEY_ID="YOUR_AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="YOUR_AWS_SECRET_ACCESS_KEY"
export AWS_SESSION_TOKEN="YOUR_AWS_SESSION_TOKEN"
```

```
git clone https://github.com/ericausente/tf-ansible-nginx.git
cd terraform-aws-nginx
terraform init
terraform apply -auto-approve
```

Ensure to modify the file as needed for your AWS instance and related settings have been set up correctly.


Step 2: Install Ansible
Ensure Ansible is installed on your local machine. If you are on macOS, you can use Homebrew to install Ansible:
```
brew install ansible
```

Verify the installation:
```
ansible --version
ansible-galaxy --version
```

Step 2: Install NGINX Role from Ansible Galaxy

Ansible Galaxy is a repository for sharing and distributing Ansible roles. You can use the following commands to install the NGINX role from Ansible Galaxy:
```
ansible-galaxy install nginxinc.nginx
```

To install the latest stable release of the role on your system, use:

```
ansible-galaxy install nginxinc.nginx
```

If you have already installed the role and want to update it to the latest release, use:
```
ansible-galaxy install -f nginxinc.nginx
```

Step 3: Fromt the Cloned Repo, you will find the Ansible playbook under the "ansible" directory. 
```
ls
                    			2-deploy-nginx-web-server.yml			5-check-app-protect.yml
1-deploy-nginx-oss.yml				3-deploy-nginx-web-server-proxy.yml		
1-deploy-nginx.yml				4-deploy-nginx-app-protect-web-server-proxy.yml	

```

Step 4: Set Up Inventory File
Create or edit your inventory file (e.g., hosts.ini) and add the following content:

```
[aws_instance]
18.141.239.174 ansible_user=ubuntu ansible_ssh_private_key_file=/Users/e.ausente/nginx-ansible-demo/ausente-f5-account-key-value-pair.pem
```

Step 5: Deploy NGINX using Ansible
Run the Ansible playbook to deploy NGINX on the AWS instance:

```
ansible-playbook -i hosts.ini ansible/1-deploy-nginx-oss.yml
```

The playbook will install NGINX on the specified AWS instance and configure it to serve a simple web app and act as a reverse proxy.

Additionally, if you want to set up the NGINX App Protect, you can add the necessary tasks to the Ansible playbook to achieve that. You may refer to the NGINX App Protect documentation, alessfg's github repo and create Ansible tasks accordingly.

Remember to customize any paths, variables, or configurations as per your requirements. 

With these steps, you should be able to set up Terraform for your AWS instance and install NGINX using Ansible in a more organized and structured manner.
