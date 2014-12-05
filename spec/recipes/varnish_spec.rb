require_relative '../spec_helper'

describe 'zabbix-custom-checks::varnish' do
  let(:runner) { ChefSpec::Runner.new }
  let(:node) { runner.node }
  let(:chef_run) do
    runner.converge(described_recipe)
  end

  it 'includes the zabbix recipe' do
    expect(chef_run).to include_recipe('zabbix-custom-checks::default')
  end

  it 'configures check' do
    expect(chef_run).to render_file(
      '/opt/zabbix/agent_include/varnish.conf'
    ).with_content(
      %r(/usr/bin/varnishstat)
    )

    expect(chef_run).to render_file(
      '/etc/sudoers.d/zabbix-varnish'
    ).with_content(
      %r(/usr/bin/varnishstat)
    )
  end
end
