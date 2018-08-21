# Hypernode-vpn documentation
Hypernode-vpn offers a secure way of directly connecting to your database from any location.
Using [OpenVPN](https://openvpn.net/).

### How it works
Our Hypernode-vpn solution implements a standard OpenVPN TLS tunnel connection to the Hypernode.
Which can be used to talk to the MySQL database securely.
You simply enable OpenVPN on your Hypernode and all the required config and packages are installed automatically.
The automation will generate a user configuration which you can use to connect to the Hypernode.

### Using OpenVPN
To be able to connect to your Hypernode you will need to install the latest version of the 
[OpenVPN client](https://openvpn.net/index.php/open-source/downloads.html).

### Enable / Disable
This can simply be done on the Hypernode itself.
 ```
 hypernode-systemctl settings openvpn --value <true/false>
 ```
This command will cause trigger the Hypernode automation to start installing OpenVPN and generate the configuration.
Or delete all the configuration when disabling.

### Client configuration
After the installation process is complete the client configuration can be found in `/data/openvpn/client-configs`.
Normally the standard configuration will be called something like `openvpnclient.<appname>.<domain>.ovpn`.
Place this file in your OpenVPN config directory on your PC/device. This file contains the OpenVPN private key for you Hypernode, so keep it secure!

### Connecting
When you have downloaded your client configuration use it to connect to your Hypernode.

Linux example
```
$ sudo openvpn --config /etc/openvpn/openvpnclient.erikhyperdev.hypernode.io
```

Windows exmaple
```
# Make sure the client config is placed in the correct directory
# Normally this is C:/ProgramFiles/OpenVPN/config
Start OpenVPN-GUI
SystemTray -> OpenVPN-GUI -> openvpnclient.erikhyperdev.hypernode.io -> Connect
```

## Functionalities
### Whitelisting
Whitelisting allows you to add IP's for specific purposes. To find out how to use this have a look at [the documentation
for this endpoint](/Documentation/hypernode-api/whitelisting/README.md).

### Hypernode settings
This endpoint allows you to set settings for your Hypernode. For example, you can set your `php_version` or blackfire
tokens here. To find out how to use this have a look at [the documentation for this endpoint](
/Documentation/hypernode-api/settings/README.md).
