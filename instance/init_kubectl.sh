    #!/bin/bash
    set -ex
    sudo yum update -y
    sudo yum install docker -y
    sudo yum install git -y
    sudo systemctl start docker
    sudo usermod -a -G docker ec2-user
    curl -sLo kind https://kind.sigs.k8s.io/dl/v0.11.0/kind-linux-amd64
    sudo install -o root -g root -m 0755 kind /usr/local/bin/kind
    rm -f ./kind
    curl -LO "https://s3.us-west-2.amazonaws.com/amazon-eks/1.21.14/2023-01-30/bin/linux/amd64/kubectl"
    sudo install -o root -g root  -m 0755 kubectl /usr/local/bin/kubectl
    rm -f ./kubectl
    #kind create cluster --config kind.yaml
    sudo cd /tmp/
    HOME=/home/ec2-user/ git config --global user.email "nmpanchal2@myseneca.com"
    HOME=/home/ec2-user/ git config --global user.name "Nirmal"
    chmod 600 /home/ec2-user/.ssh/id_rsa
    GIT_SSH_COMMAND="sudo ssh -i /home/ec2-user/.ssh/id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git clone git@github.com:NirmalSeneca/k8s_manifest.git
    sudo chown -R ec2-user:ec2-user /tmp/k8s_manifest
    sudo chown -R ec2-user:ec2-user /home/ec2-user/.ssh/id_rsa