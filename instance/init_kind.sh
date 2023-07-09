    #!/bin/bash
    set -ex
    sudo usermod -a -G docker ec2-user
    kind create cluster --config kind.yaml