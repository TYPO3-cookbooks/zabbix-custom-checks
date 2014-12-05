require_relative '../spec_helper'

describe 'zabbix-custom-checks::hwraid-adaptec-aac-raid' do
  let(:runner) { ChefSpec::Runner.new }
  let(:node) { runner.node }
  let(:chef_run) do
    runner.converge(described_recipe)
  end

  it 'includes the zabbix dedault checks' do
    expect(chef_run).to include_recipe('zabbix-custom-checks::default')
  end

  it 'configures hwraid checks' do
    expect(chef_run).to render_file(
      '/opt/zabbix/agent_include/hwraid-adaptec-aac-raid.conf'
    ).with_content(
      %r(/usr/sbin/arcconf)
    )

    expect(chef_run).to render_file(
      '/etc/sudoers.d/zabbix-hwraid-adaptec-aac-raid'
    ).with_content(
      %r(^# Zabbix configuration for running checks without password$)
    )
  end
end
