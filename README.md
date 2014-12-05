# Description

Adds custom checks for Zabbix monitoring

# Requirements

## Platform:

*No platforms defined*

## Cookbooks:

* apache2
* chef_handler
* nginx
* sudo
* zabbix

# Attributes

* `node["zabbix_custom_checks"]["nginx"]["port"]` -  Defaults to `80`.

# Recipes

* zabbix-custom-checks::apache2 - Monitors Apache2 status
* zabbix-custom-checks::apt-update-check - Monitors for system software updates
* zabbix-custom-checks::chef-client - Monitors results und execution time of chef run (as Zabbix traps)
* zabbix-custom-checks::default - Does currently nothing
* zabbix-custom-checks::hwraid-adaptec-aac-raid - Monitors AAC-RAID adapters using hwraid packages
* zabbix-custom-checks::hwraid-lsi-megaraid - Monitors LSI Megaraid adapters using hwraid packages
* zabbix-custom-checks::nginx - Monitors Nginx status
* zabbix-custom-checks::openvz-host - Monitors OpenVZ host status
* zabbix-custom-checks::openvz-virtual - Monitors OpenVZ guest status
* zabbix-custom-checks::redis - Monitors Redis status
* zabbix-custom-checks::varnish - Monitors Varnish status

# License and Maintainer

Maintainer:: TYPO3 Association (<steffen.gebert@typo3.org>)

License:: Apache 2.0
