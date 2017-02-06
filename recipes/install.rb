#
# Cookbook Name:: pnp4nagios
# Recipe:: install
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

require 'tmpdir'

temp_d        = Dir.tmpdir
tarball_file  = ::File.join(temp_d, "pnp4nagios-#{node['pnp4nagios']['version']}.tar.gz")

remote_file tarball_file do
  source node['pnp4nagios']['source_url']
  not_if { File.exist?(node['pnp4nagios']['source_dir']) }
end

[node['pnp4nagios']['install_dir'],
 node['pnp4nagios']['tmp_dir'],
 node['pnp4nagios']['conf_dir'],
 node['pnp4nagios']['home_dir'],
 node['pnp4nagios']['log_dir'],
 node['pnp4nagios']['rrd_stats_dir']].each do |d|
  directory d do
    owner node['pnp4nagios']['user']
    group node['pnp4nagios']['group']
    mode 0o775
  end
end

bash 'extract_compile_pnp4nagios' do
  user 'root'
  cwd '/tmp'

  code <<-EOS
    tar xzf #{tarball_file} -C /usr/local/src/
    cd #{node['pnp4nagios']['source_dir']}
    ./configure --prefix=#{node['pnp4nagios']['install_dir']} \
      --sysconfdir=#{node['pnp4nagios']['conf_dir']} \
      --bindir=/usr/bin \
      --sbindir=/sbin \
      --with-perfdata-logfile=#{node['pnp4nagios']['log_dir']}/perdata.log \
      --with-perfdata-dir=#{node['pnp4nagios']['perf_data_dir']} \
      --with-perfdata-spool-dir=#{node['pnp4nagios']['spool_dir']} \
      --with-httpd-conf=#{node['pnp4nagios']['tmp_dir']} \
      --with-init-dir=#{node['pnp4nagios']['tmp_dir']} \
      --with-nagios-user=#{node['pnp4nagios']['user']} \
      --with-nagios-group=#{node['pnp4nagios']['group']}
    make all
    make fullinstall
  EOS
  creates node['pnp4nagios']['source_dir']
  action :run
end

file ::File.join(node['pnp4nagios']['install_dir'], 'share', 'install.php') do
  action :delete
end
