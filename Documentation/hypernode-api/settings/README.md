# Hypernode-API settings
The following endpoints are available:
```python
PATCH: https://api.hypernode.com/v1/app/<your_app_name>/
```

## PATCH
`PATCH` can be used for setting settings for your Hypernode. You can specify the following data in the post request:

- `php_version`: ("5.6", "7.0", "7.1", "7.3") - Indicates which PHP version the node should be running.
- `enable_ioncube`: boolean - Indicates whether this node should have the ioncube loader enabled. See [this changelog for more information](https://support.hypernode.com/changelog/release-4853-ioncube-loader-php-hypernode-update-php7-1-sneak-peek/).
- `php_apcu_enabled`: boolean - Whether or not to enable the [php-apcu](https://salsa.debian.org/php-team/pecl/php-apcu) PHP module. This is disabled by default. If you run Akeneo or Shopware you probably want to enable this. For running only Magento we recommend that you keep this disabled.
- `password_auth`: boolean - Indicates whether password authentication for the node is allowed instead of only SSH keys.
- `modern_ssl_config_enabled`: boolean - Indicates whether this node will have the Mozilla Modern SSL configuration 
configured. This provides a higher level of security but loses compatibility with some browsers. For more information 
about this setting see [this changelog](https://support.hypernode.com/changelog/release-4582-updated-configurable-ssl-ciphers/).
- `modern_ssh_config_enabled`: boolean - Indicates whether this node will have a stricter set of SSH encryption algorithms enabled. See [this changelog for more information about this setting](https://support.hypernode.com/changelog/release-5139-stricter-ssh-encryption-algorithms/)
- `mysql_ft_min_word_len`: ("4", "2") - Configure the MySQL [minimum length of the word to be included in a MyISAM FULLTEXT index](https://support.hypernode.com/changelog/release-5869-configurable-ft_min_word_len-for-products-with-short-names/).
- `mysql_tmp_on_data_enabled`: boolean - Indicates whether the MySQL `tmp` directory is located in the `/data/` 
directory of the `app` user or in the `/tmp/` directory of the `root` user. The `root` user does not have the same amount
of space available as the `app` user, so enabling this might prevent MySQL from taking up all disk space at the cost of
taking of the space of the `app` user. Mostly useful for large shops who create a lot of temporary tables with MySQL. 
For more information about this settings see [this changelog](https://support.hypernode.com/changelog/release-5133-configurable-mysql-temporary-directory-extra-space/).
- `mysql_disable_stopwords`: boolean - [Opt-in disable stopwords for MyISAM Search Indexes](https://support.hypernode.com/changelog/release-6079-opt-in-disable-stopwords-for-myisam-search-indexes/).
- `mysql_enable_large_thread_stack`: boolean - [Opt-in enable large mysql thread_stack](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_thread_stack).
This setting allows you to change the MySQL thread_stack from the default of `192k` to `512k`. We've seen that in some cases this setting can sometimes prevent some issues in Shopware shops with complex queries. Also see [this changelog](https://support.hypernode.com/changelog/release-7083-opt-in-large-mysql-thread_stack/).
- `redis_persistent_instance`: boolean - Indicates whether another Redis instance will be started which can be used for 
sessions instead of caching. Please note that this might require some changes on your end. For more information about this setting see [this changelog](https://support.hypernode.com/changelog/experimental-changes-redis-sessions-aws-performance/).
- `firewall_block_ftp_enabled`: boolean - Indicates whether FTP is completely blocked or not in favour of SFTP. For 
more information about this setting see [this changelog](https://support.hypernode.com/changelog/release-5340-block-ftp-access-sftp-used-systems-tweaks/).
- `disable_optimizer_switch`: boolean - Indicates whether `use_index_extensions` and `mrr` are turned off. If turned off 
this can improve performance due to an issue in PHP 5.6 related to Multi-Range Read Optimization. For more information about
this setting see [this changelog](https://support.hypernode.com/changelog/release-5340-block-ftp-access-sftp-used-systems-tweaks/).
- `blackfire_enabled`: boolean - Indicates whether BlackFire is enabled on your node.
- `blackfire_server_id`: - string - The BlackFire server id for your blackfire setup.
- `blackfire_server_token`: string - The BlackFire server token for your blackfire setup.
- `openvpn_enabled`: boolean - Enable or disable [OpenVPN for secure connections](/Documentation/hypernode-vpn/README.md)
- `varnish_esi_ignore_https`: boolean - Enable or disable [Varnish Edge Side Includes over HTTPS](https://support.hypernode.com/changelog/release-4560-varnish-edge-side-includes-https/)
- `permissive_memory_management`: boolean - Indicates whether we should maintain a strict or permissive Out Of Memory policy. If enabled user level processes won't be killed preventively as quickly. Note that this can actually cause more OOM situations overall depending on the memory footprint of your shop.
- `varnish_version`: ("4.0") - Which varnish version to use for your node.
- `varnish_enabled`: boolean - Indicates whether Varnish should be used for this node or not.
- `varnish_secret`: string - Read-only: The Varnish secret for this node.
- `rabbitmq_enabled`: boolean - Indicates whether RabbitMQ should be enabled on this node or not.
