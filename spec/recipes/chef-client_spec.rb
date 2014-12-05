require_relative '../spec_helper'

describe 'zabbix-custom-checks::chef-client' do
  let(:runner) { ChefSpec::Runner.new }
  let(:node) { runner.node }
  let(:chef_run) do
    runner.converge(described_recipe)
  end

  it 'includes the zabbix recipe' do
    expect(chef_run).to include_recipe('zabbix-custom-checks::default')
    expect(chef_run).to include_recipe('chef_handler::default')
  end

  it 'configures report handler' do
    expect(chef_run).to render_file(
      '/var/chef/handlers/zabbix-report.rb'
    ).with_content(
      %r(^require 'rubygems'$)
    )
  end
end
