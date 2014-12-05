require_relative '../spec_helper'

describe 'zabbix-custom-checks::hwraid-lsi-megaraid' do
  let(:runner) { ChefSpec::Runner.new }
  let(:node) { runner.node }
  let(:chef_run) do
    runner.converge(described_recipe)
  end

  it 'includes the zabbix dedault checks' do
    expect(chef_run).to include_recipe('zabbix-custom-checks::default')
  end

  it 'configures lsi megaraid checks' do
    expect(chef_run).to render_file(
      '/opt/zabbix/agent_include/hwraid-lsi-megaraid.conf'
    ).with_content(
      %r(/usr/sbin/megasasctl)
    )

    expect(chef_run).to render_file(
      '/etc/sudoers.d/zabbix-hwraid-lsi-megaraid'
    ).with_content(
      %r(^# Zabbix configuration for running checks without password$)
    )
  end
end
