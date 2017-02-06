#
# Cookbook Name:: pnp4nagios
# Recipe:: apache
#
# Copyright 2014, Virender Khatri
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# node.default['apache']['servertokens']    = 'Minimal'

node['pnp4nagios']['apache_modules'].each { |mod| include_recipe "apache2::#{mod}" }

template node['pnp4nagios']['auth_file'] do
  source 'passwd.erb'
  owner node['apache2']['user']
  group node['apache2']['group']
  variables(:users => node['pnp4nagios']['users'])
  mode 0o640
  only_if { node['pnp4nagios']['manage_auth_file'] }
end

template ::File.join(node['apache']['dir'], 'conf-available', 'pnp4nagios.conf') do
  source 'apache.vhost.erb'
  owner node['apache2']['user']
  group node['apache2']['group']
  mode 0o660
  variables(:auth_file => node['pnp4nagios']['auth_file'],
            :install_dir => node['pnp4nagios']['install_dir'])
  notifies :reload, 'service[apache2]', :delayed
end

apache_config 'pnp4nagios'
