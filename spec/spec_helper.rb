require 'chefspec'

RSpec.configure do |config|
  config.cookbook_path = [
    'cookbooks',
    'site-cookbooks'
  ]
  config.role_path = 'roles'

  config.before(:each) do
    # Workarround for the `command stub` may be too loose
    stub_command(/^su zabbix -c /).and_return(true)
  end
end
