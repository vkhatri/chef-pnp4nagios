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
            :spool_dir => node['pnp4nagios']['spool_dir'],
            :log_dir => node['pnp4nagios']['log_dir'],
            :home_dir => node['pnp4nagios']['home_dir'],
            :install_dir => node['pnp4nagios']['install_dir'],

            :log_type => node['pnp4nagios']['npcd']['log_type'],
            :max_log_file_size => node['pnp4nagios']['npcd']['max_log_file_size'],
            :log_level => node['pnp4nagios']['npcd']['log_level'],
            :perfdata_run_cmd_args => node['pnp4nagios']['npcd']['perfdata_run_cmd_args'],
            :identify_npcd => node['pnp4nagios']['npcd']['identify_npcd'],
            :npcd_max_threads => node['pnp4nagios']['npcd']['npcd_max_threads'],
            :sleep_time => node['pnp4nagios']['npcd']['sleep_time'],
            :load_threshold => node['pnp4nagios']['npcd']['load_threshold'],
            :pid_file => node['pnp4nagios']['npcd']['pid_file'],
            :perfdata_spool_filename => node['pnp4nagios']['npcd']['perfdata_spool_filename'],
            :perfdata_file_processing_interval => node['pnp4nagios']['npcd']['perfdata_file_processing_interval'])
end

template ::File.join(node['pnp4nagios']['conf_dir'], 'process_perfdata.cfg') do
  source 'process_perfdata.cfg.erb'
  owner node['pnp4nagios']['user']
  group node['pnp4nagios']['group']
  mode node['pnp4nagios']['perms']
  notifies :restart, 'service[npcd]', :delayed
  variables(:conf_dir => node['pnp4nagios']['conf_dir'],
            :log_dir => node['pnp4nagios']['log_dir'],
            :rrd_daemon_opts => node['pnp4nagios']['rrd_daemon_opts'],
            :rrd_path => node['pnp4nagios']['perf_data_dir'],
            :rrdtool => node['pnp4nagios']['rrdtool'],
            :rrd_stats_dir => node['pnp4nagios']['rrd_stats_dir'],

            :timeout => node['pnp4nagios']['process_perfdata']['timeout'],
            :use_rrds => node['pnp4nagios']['process_perfdata']['use_rrds'],
            :rrd_storage_type => node['pnp4nagios']['process_perfdata']['rrd_storage_type'],
            :rrd_heartbeat => node['pnp4nagios']['process_perfdata']['rrd_heartbeat'],
            :rra_step => node['pnp4nagios']['rra_step'],
            :log_level => node['pnp4nagios']['process_perfdata']['log_level'],
            :xml_enc => node['pnp4nagios']['process_perfdata']['xml_enc'],
            :xml_update_delay => node['pnp4nagios']['process_perfdata']['xml_update_delay'],
            :prefork => node['pnp4nagios']['process_perfdata']['prefork'],
            :gearman_host => node['pnp4nagios']['process_perfdata']['gearman_host'],
            :requests_per_child => node['pnp4nagios']['process_perfdata']['requests_per_child'],
            :encryption => node['pnp4nagios']['process_perfdata']['encryption'],
            :key => node['pnp4nagios']['process_perfdata']['key'],
            :key_file => node['pnp4nagios']['process_perfdata']['key_file'])
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
            :rrd_daemon_opts => node['pnp4nagios']['rrd_daemon_opts'],
            :livestatus_socket => node['pnp4nagios']['livestatus_socket'],
            :nagios_base => node['pnp4nagios']['nagios_base'],
            :rrdtool => node['pnp4nagios']['rrdtool'],

            :views => node['pnp4nagios']['config']['views'],
            :use_url_rewriting => node['pnp4nagios']['config']['use_url_rewriting'],
            :graph_width => node['pnp4nagios']['config']['graph_width'],
            :graph_height => node['pnp4nagios']['config']['graph_height'],
            :zgraph_width => node['pnp4nagios']['config']['zgraph_width'],
            :zgraph_height => node['pnp4nagios']['config']['zgraph_height'],
            :right_zoom_offset => node['pnp4nagios']['config']['right_zoom_offset'],
            :pdf_width => node['pnp4nagios']['config']['pdf_width'],
            :pdf_height => node['pnp4nagios']['config']['pdf_height'],
            :pdf_page_size => node['pnp4nagios']['config']['pdf_page_size'],
            :pdf_margin_top => node['pnp4nagios']['config']['pdf_margin_top'],
            :pdf_margin_left => node['pnp4nagios']['config']['pdf_margin_left'],
            :pdf_margin_right => node['pnp4nagios']['config']['pdf_margin_right'],
            :graph_opt => node['pnp4nagios']['config']['graph_opt'],
            :pdf_graph_opt => node['pnp4nagios']['config']['pdf_graph_opt'],
            :refresh => node['pnp4nagios']['config']['refresh'],
            :max_age => node['pnp4nagios']['config']['max_age'],
            :temp => node['pnp4nagios']['config']['temp'],
            :multisite_base_url => node['pnp4nagios']['config']['multisite_base_url'],
            :multisite_site => node['pnp4nagios']['config']['multisite_site'],
            :auth_enabled => node['pnp4nagios']['config']['auth_enabled'],
            :allowed_for_all_services => node['pnp4nagios']['config']['allowed_for_all_services'],
            :allowed_for_all_hosts => node['pnp4nagios']['config']['allowed_for_all_hosts'],
            :allowed_for_service_links => node['pnp4nagios']['config']['allowed_for_service_links'],
            :allowed_for_host_search => node['pnp4nagios']['config']['allowed_for_host_search'],
            :allowed_for_host_overview => node['pnp4nagios']['config']['allowed_for_host_overview'],
            :allowed_for_pages => node['pnp4nagios']['config']['allowed_for_pages'],
            :overview_range => node['pnp4nagios']['config']['overview_range'],
            :popup_width => node['pnp4nagios']['config']['popup_width'],
            :ui_theme => node['pnp4nagios']['config']['ui_theme'],
            :lang => node['pnp4nagios']['config']['lang'],
            :date_fmt => node['pnp4nagios']['config']['date_fmt'],
            :enable_recursive_template_search => node['pnp4nagios']['config']['enable_recursive_template_search'],
            :show_xml_icon => node['pnp4nagios']['config']['show_xml_icon'],
            :use_fpdf => node['pnp4nagios']['config']['use_fpdf'],
            :use_calendar => node['pnp4nagios']['config']['use_calendar'],
            :mobile_devices => node['pnp4nagios']['config']['mobile_devices'])
end

template ::File.join(node['pnp4nagios']['conf_dir'], 'rra.cfg') do
  source 'rra.cfg.erb'
  owner node['pnp4nagios']['user']
  group node['pnp4nagios']['group']
  mode node['pnp4nagios']['perms']
  notifies :restart, 'service[npcd]', :delayed
  variables(:rra_step => node['pnp4nagios']['rra_step'], :rra => node['pnp4nagios']['rra'])
end

template '/etc/default/npcd' do
  source 'sysconfig.npcd.erb'
  owner 'root'
  group 'root'
  mode 0o744
  notifies :restart, 'service[npcd]', :delayed
  variables(:conf_dir => node['pnp4nagios']['conf_dir'])
  only_if { node['platform_family'] == 'debian' }
end

template '/etc/init.d/npcd' do
  source "init.npcd.#{node['platform_family']}.erb"
  owner 'root'
  group 'root'
  mode 0o744
  notifies :restart, 'service[npcd]', :delayed
  variables(:home_dir => node['pnp4nagios']['home_dir'],
            :conf_dir => node['pnp4nagios']['conf_dir'],
            :user => node['pnp4nagios']['user'],
            :group => node['pnp4nagios']['group'],
            :log_dir => node['pnp4nagios']['log_dir'],
            :install_dir => node['pnp4nagios']['install_dir'])
end

template '/etc/default/pnp_gearman_worker' do
  source 'sysconfig.pnp_gearman_worker.erb'
  owner 'root'
  group 'root'
  mode 0o744
  variables(:conf_dir => node['pnp4nagios']['conf_dir'])
  only_if { node['platform_family'] == 'debian' }
end

template '/etc/init.d/pnp_gearman_worker' do
  source "init.npcd.#{node['platform_family']}.erb"
  owner 'root'
  group 'root'
  mode 0o744
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
