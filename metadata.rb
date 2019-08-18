name             "zabbix-custom-checks"
maintainer       "TYPO3 Association"
maintainer_email "steffen.gebert@typo3.org"
license          "Apache 2.0"
description      "Adds custom checks for Zabbix monitoring"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))

version          IO.read(File.join(File.dirname(__FILE__), 'VERSION')) rescue '0.0.1'

recipe           "zabbix-custom-checks::apache2", "Monitors Apache2 status"
recipe           "zabbix-custom-checks::apt-update-check", "Monitors for system software updates"
recipe           "zabbix-custom-checks::chef-client", "Monitors results und execution time of chef run (as Zabbix traps)"
recipe           "zabbix-custom-checks::default", "Does currently nothing"
recipe           "zabbix-custom-checks::git", "Git command tests"
recipe           "zabbix-custom-checks::hwraid-adaptec-aac-raid", "Monitors AAC-RAID adapters using hwraid packages"
recipe           "zabbix-custom-checks::hwraid-lsi-megaraid", "Monitors LSI Megaraid adapters using hwraid packages"
recipe           "zabbix-custom-checks::nginx", "Monitors Nginx status"
recipe           "zabbix-custom-checks::openvz-host", "Monitors OpenVZ host status"
recipe           "zabbix-custom-checks::openvz-virtual", "Monitors OpenVZ guest status"
recipe           "zabbix-custom-checks::pdsn", "Monitors PowerDNS server status"
recipe           "zabbix-custom-checks::redis", "Monitors Redis status"
recipe           "zabbix-custom-checks::varnish", "Monitors Varnish status"

# depends          "apache2"
# depends          "chef_handler"
# depends          "nginx"
depends          "sudo"

# use same version as t3-base
depends          "zabbix", "= 0.0.43"

# For compatibility with Chef 12.x
depends          "seven_zip",    "< 3.0.0"
