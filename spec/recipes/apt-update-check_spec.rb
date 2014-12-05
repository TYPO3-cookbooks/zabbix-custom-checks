require_relative '../spec_helper'

describe 'zabbix-custom-checks::apt-update-check' do
  let(:runner) { ChefSpec::Runner.new }
  let(:node) { runner.node }
  let(:chef_run) do
    runner.converge(described_recipe)
  end

  it 'includes the zabbix dedault checks' do
    expect(chef_run).to include_recipe('zabbix-custom-checks::default')
  end

  it 'configures apt-update check' do
    expect(chef_run).to render_file(
      '/opt/zabbix/agent_include/apt-update-check.conf'
    ).with_content(
      %r(^UserParameter=custom.apt-update-check.security,/usr/lib/update-notifier/apt-check 2>&1 | cut -f1 -d";"$)
    )
  end
end
