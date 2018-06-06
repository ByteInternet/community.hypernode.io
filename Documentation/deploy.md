# Deploying community.hypernode.io

This repo contains the source code for https://community.hypernode.io and the playbook to deploy it to production. When deploying to production this repo will be cloned to the webroot on the `community` Hypernode and so will some other community projects for which a [docsify](https://github.com/QingWei-Li/docsify/) front-end is available.

## Deployment

All merges to master in this repo or in one of the related community project repos will be automatically deployed to production once an hour by the deployment cron. Alternatively, look for the deploy job in Jenkins to force a deploy, or manually run `/data/web/periodic_deploy.sh` on the server.

Deployment requirements
- ansible 
- public key in ```/data/web/.ssh/authorized_keys``` file on community.hypernode.io

## Development

For testing, make sure you have the following installed:
- python-nose (or install nose in a virtualenv)
- python-selenium (or install selenium in a virtualenv)
- [PhantomJS](https://gist.github.com/julionc/7476620)

Configure sudoers file for vagrant-hostmanager plugin
```
# sudo visudo
Cmnd_Alias VAGRANT_HOSTMANAGER_UPDATE = /bin/cp /home/youruser/.vagrant.d/tmp/hosts.local /etc/hosts
youruser   ALL=(root) NOPASSWD: VAGRANT_HOSTMANAGER_UPDATE
```

## Running the tests

To test this site in a [hypernode-vagrant](https://github.com/ByteInternet/hypernode-vagrant)
```
git clone git@github.com:ByteInternet/community.hypernode.io.git && cd community.hypernode.io

TEST_URL=community.hypernode.io.hypernode.local ./deploy_test.sh
```

If you want to keep the node for debugging specify the keep node flag
```
TEST_URL=community.hypernode.io.hypernode.local ./deploy_test.sh -k true
```
