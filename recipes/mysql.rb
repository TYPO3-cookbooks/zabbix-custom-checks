#
# Cookbook Name:: zabbix-custom-checks
# Recipe:: mysql
#
# Copyright 2018, TYPO3 Association
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "zabbix-custom-checks::default"

template "#{node['zabbix']['agent']['include_dir']}/mysql.conf" do
  source "mysql/mysql.conf.erb"
  mode "644"
  notifies :restart, "service[zabbix_agentd]" if Dir.exist?("#{node['zabbix']['agent']['include_dir']}")
end
