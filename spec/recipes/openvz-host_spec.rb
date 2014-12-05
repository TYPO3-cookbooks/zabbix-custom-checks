require_relative '../spec_helper'

describe 'zabbix-custom-checks::openvz-host' do
  let(:runner) { ChefSpec::Runner.new }
  let(:node) { runner.node }
  let(:chef_run) do
    runner.converge(described_recipe)
  end

  it 'does nothing'
end
