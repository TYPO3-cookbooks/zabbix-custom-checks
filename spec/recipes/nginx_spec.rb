require_relative '../spec_helper'

describe 'zabbix-custom-checks::nginx' do
  let(:runner) { ChefSpec::Runner.new }
  let(:node) { runner.node }
  let(:chef_run) do
    #node.set['ohai']['plugin_path'] = "/var/chef/ohai/plugins"
    runner.converge(described_recipe)
  end

  it 'includes the zabbix dedault checks' do
    pending "Ohai plugin can not be reloaded"
    expect(chef_run).to include_recipe('zabbix-custom-checks::default')
  end

  it 'configures nginx checks' do
    pending "Ohai plugin can not be reloaded"
    expect(chef_run).to render_file(
      '/opt/zabbix/agent_include/nginx.conf'
    ).with_content(
      %r(^UserParameter=custom.nginx.accepts,/opt/zabbix/externalscripts/nginx_status.sh accepts$)
    )
  end

  it 'creates check status script' do
    pending "Ohai plugin can not be reloaded"
    expect(chef_run).to create_template(
      '/opt/zabbix/externalscripts/nginx_status.sh'
    ).with(
      mode: '755'
    )

    expect(chef_run).to render_file(
      '/opt/zabbix/externalscripts/nginx_status.sh'
    ).with_content(
      %r(^#!/bin/bash$)
    )
  end

end
