require_relative '../spec_helper'

describe 'zabbix-custom-checks::apache2' do
  let(:runner) { ChefSpec::Runner.new }
  let(:node) { runner.node }
  let(:chef_run) do
    runner.converge(described_recipe)
  end

  it 'includes the zabbix recipe' do
    expect(chef_run).to include_recipe('zabbix-custom-checks::default')
  end

  it 'configures apache2 check' do
    expect(chef_run).to render_file(
      '/opt/zabbix/agent_include/apache2.conf'
    ).with_content(
      %r(/opt/zabbix/externalscripts/apache2_status.sh \$1$)
    )
  end

  it 'creates check status script' do
    expect(chef_run).to create_template(
      '/opt/zabbix/externalscripts/apache2_status.sh'
    ).with(
      mode: '755'
    )

    expect(chef_run).to render_file(
      '/opt/zabbix/externalscripts/apache2_status.sh'
    ).with_content(
      %r(^#!/bin/bash$)
    )
  end
end
