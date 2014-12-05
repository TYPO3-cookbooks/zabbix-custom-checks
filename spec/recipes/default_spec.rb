require_relative '../spec_helper'

describe 'zabbix-custom-checks::default' do
  let(:runner) { ChefSpec::Runner.new }
  let(:node) { runner.node }
  let(:chef_run) do
    runner.converge(described_recipe)
  end

  it 'includes the zabbix recipe' do
    expect(chef_run).to include_recipe('zabbix')
  end
end
