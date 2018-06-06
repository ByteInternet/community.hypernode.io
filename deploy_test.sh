#!/bin/sh

# die when a command has a nonzero exit code
set -e 

while getopts "k:" opt; do
    case "$opt" in
        k)
            keep_node="$OPTARG" ;;
    esac
done

running=$([ -d hypernode-vagrant ] && cd hypernode-vagrant && vagrant status | grep running > /dev/null 2>&1 && echo 1 || echo 0)

if [ -z "$keep_node" -o "$running" -eq 0 ]; then
    # make sure the required vagrant plugins are installed
    vagrant plugin list | grep vagrant-vbguest || vagrant plugin install vagrant-vbguest
    vagrant plugin list | grep vagrant-hostmanager || vagrant plugin install vagrant-hostmanager

    # if hypernode-vagrant directory exists
    if test -d hypernode-vagrant; then
        cd hypernode-vagrant
        # Destroy lingering instance if there is one
        vagrant destroy -f
        cd ../
    
        # Remove previous Vagrant checkout if it exists
        rm -Rf hypernode-vagrant
    fi
    
    # create a new checkout of the hypernode-vagrant repo
    git clone https://github.com/byteinternet/hypernode-vagrant
    
    # move into the hypernode-vagrant repository directory
    cd hypernode-vagrant
    
    # write our local.yml to the hypernode-vagrant directory
    cat << EOF > local.yml
---
fs:
  type: virtualbox
hostmanager:
  extra-aliases:
  - my-custom-store-url1.local
  - my-custom-store-url2.local
  default_domain: hypernode.local
magento:
  version: 1
php:
  version: 7.0
varnish:
  state: false
firewall:
  state: false
cgroup:
  state: false
xdebug:
  state: false
vagrant:
  box: hypernode_php7
  box_url: http://vagrant.hypernode.com/customer/php7/catalog.json
ubuntu_version: precise
EOF
    
    # make sure we have the last hypernode revision
    vagrant box update || /bin/true  # don't fail if the box hasn't been added yet
    # boot new vagrant instance
    vagrant up
    cd ../
fi;

# register unique hostname of booted instance
cd hypernode-vagrant
BOX_IP=$(vagrant ssh-config | grep HostName | awk '{print$NF}')
echo "Registered ip: $BOX_IP"
(cd ../ ; git checkout vars.yml)
echo "ansible_ssh_port: $(vagrant ssh-config | grep Port | awk '{print $NF}')" >> ../vars.yml
cd ../

# don't check ssh host key of vagrant box
export ANSIBLE_HOST_KEY_CHECKING=False

# apply deployment playbook
echo "Applying playbook"
ansible-playbook provisioning/community.yml --extra-vars "@vars.yml" --user=app -i "$BOX_IP," # mind the trailing comma

# test if new node was successfully provisioned
echo "Running tests"
nosetests testcase.py

# run the provisioning scripts again to ensure idempotency
echo "Running playbook again to ensure that it's idempotent"
ansible-playbook provisioning/community.yml --extra-vars "@vars.yml" --user=app -i "$BOX_IP," # mind the trailing comma

# test if new node is still ok after second run
echo "Running tests again"
nosetests testcase.py


if ! $keep_node; then
	cd hypernode-vagrant
	# Destroy test instance
	echo "Destroying node"
	vagrant destroy -f
	cd ../
fi;

