require_relative '../spec_helper'

describe 'zabbix-custom-checks::openvz-virtual' do
  let(:runner) { ChefSpec::Runner.new }
  let(:node) { runner.node }
  let(:chef_run) do
    runner.converge(described_recipe)
  end

  it 'includes the zabbix recipe' do
    expect(chef_run).to include_recipe('zabbix-custom-checks::default')
    expect(chef_run).to include_recipe('sudo')
  end

  it 'configures check' do
    expect(chef_run).to render_file(
      '/opt/zabbix/agent_include/openvz-virtual.conf'
    ).with_content(
      %r(/opt/zabbix/externalscripts/openvz-virtual-beancount-failcnt.py)
    )
  end

  it 'creates custom monitoring scripts' do
    expect(chef_run).to create_template(
      '/opt/zabbix/externalscripts/openvz-virtual-beancount-failcnt.py'
    ).with(
      mode: '755'
    )

    expect(chef_run).to render_file(
      '/opt/zabbix/externalscripts/openvz-virtual-beancount-failcnt.py'
    ).with_content(
      %r(^#!/usr/bin/python$)
    )

    expect(chef_run).to create_template(
      '/opt/zabbix/externalscripts/openvz-virtual-beancount-monitor.py'
    ).with(
      mode: '755'
    )

    expect(chef_run).to render_file(
      '/opt/zabbix/externalscripts/openvz-virtual-beancount-monitor.py'
    ).with_content(
      %r(^#!/usr/bin/python$)
    )
  end
end
