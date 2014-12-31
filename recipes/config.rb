#
# Cookbook Name:: pnp4nagios
# Recipe:: config
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

template ::File.join(node['pnp4nagios']['conf_dir'], 'npcd.cfg') do
  source 'npcd.cfg.erb'
  owner node['pnp4nagios']['user']
  group node['pnp4nagios']['group']
  mode node['pnp4nagios']['perms']
  notifies :restart, 'service[npcd]', :delayed
  variables(:user => node['pnp4nagios']['user'],
            :group => node['pnp4nagios']['group'],
            :log_type => node['pnp4nagios']['log_type'],
            :log_dir => node['pnp4nagios']['log_dir'],
            :max_log_file_size => node['pnp4nagios']['max_log_file_size'],
            :log_level => node['pnp4nagios']['log_level'],
            :spool_dir => node['pnp4nagios']['spool_dir'],
            :perfdata_run_cmd_args => node['pnp4nagios']['perfdata_run_cmd_args'],
            :npcd_max_threads => node['pnp4nagios']['npcd_max_threads'],
            :npcd_sleep_time => node['pnp4nagios']['npcd_sleep_time'],
            :home_dir => node['pnp4nagios']['home_dir'],
            :install_dir => node['pnp4nagios']['install_dir'])
end

template ::File.join(node['pnp4nagios']['conf_dir'], 'process_perfdata.cfg') do
  source 'process_perfdata.cfg.erb'
  owner node['pnp4nagios']['user']
  group node['pnp4nagios']['group']
  mode node['pnp4nagios']['perms']
  notifies :restart, 'service[npcd]', :delayed
  variables(:rrd_data_dir => node['pnp4nagios']['perf_data_dir'],
            :conf_dir => node['pnp4nagios']['conf_dir'],
            :log_dir => node['pnp4nagios']['log_dir'],
            :use_rrds => node['pnp4nagios']['use_rrds'],
            :rrd_listener => node['pnp4nagios']['rrd_listener'])
end

template ::File.join(node['pnp4nagios']['conf_dir'], 'config.php') do
  source 'config.php.erb'
  owner node['pnp4nagios']['user']
  group node['pnp4nagios']['group']
  mode node['pnp4nagios']['perms']
  notifies :restart, 'service[npcd]', :delayed
  variables(:rrdbase => node['pnp4nagios']['perf_data_dir'],
            :conf_dir => node['pnp4nagios']['conf_dir'],
            :install_dir => node['pnp4nagios']['install_dir'],
            :rrd_listener => node['pnp4nagios']['rrd_listener'],
            :livestatus_socket => node['pnp4nagios']['livestatus_socket'],
            :nagios_base => node['pnp4nagios']['nagios_base'])
end

template ::File.join(node['pnp4nagios']['conf_dir'], 'rra.cfg') do
  source 'rra.cfg.erb'
  owner node['pnp4nagios']['user']
  group node['pnp4nagios']['group']
  mode node['pnp4nagios']['perms']
  notifies :restart, 'service[npcd]', :delayed
  variables(:rra_step => node['pnp4nagios']['rra_step'], :rra => node['pnp4nagios']['rra'])
end

template '/etc/init.d/npcd' do
  source "init.npcd.#{node['platform_family']}.erb"
  owner 'root'
  group 'root'
  mode 0744
  notifies :restart, 'service[npcd]', :delayed
  variables(:home_dir => node['pnp4nagios']['home_dir'],
            :conf_dir => node['pnp4nagios']['conf_dir'],
            :user => node['pnp4nagios']['user'],
            :group => node['pnp4nagios']['group'],
            :install_dir => node['pnp4nagios']['install_dir'])
end

template '/etc/init.d/pnp_gearman_worker' do
  source "init.npcd.#{node['platform_family']}.erb"
  owner 'root'
  group 'root'
  mode 0744
  variables(:home_dir => node['pnp4nagios']['home_dir'],
            :conf_dir => node['pnp4nagios']['conf_dir'],
            :user => node['pnp4nagios']['user'],
            :var_dir => node['pnp4nagios']['var_dir'],
            :install_dir => node['pnp4nagios']['install_dir'])
end

service 'npcd' do
  supports :restart => true
  action [:enable, :start]
end
