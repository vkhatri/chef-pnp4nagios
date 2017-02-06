default['pnp4nagios']['version'] = '0.6.25'

# owner / group
default['pnp4nagios']['user'] = 'nagios'
default['pnp4nagios']['group'] = 'nagios'
default['pnp4nagios']['perms'] = '0644'

default['pnp4nagios']['users']['pnp4nagios'] = '$apr1$WLA2Rsgm$YtldhsVj1PFzrKxIooHNI/' # pnp4nagios:pnp4nagios

default['pnp4nagios']['source_url'] = "http://downloads.sourceforge.net/project/pnp4nagios/PNP-0.6/pnp4nagios-#{node['pnp4nagios']['version']}.tar.gz"

default['pnp4nagios']['source_dir'] = "/usr/local/src/pnp4nagios-#{node['pnp4nagios']['version']}"
default['pnp4nagios']['install_dir'] = '/usr/local/pnp4nagios'
default['pnp4nagios']['tmp_dir'] = ::File.join(node['pnp4nagios']['install_dir'], 'tmpdir')
default['pnp4nagios']['var_dir'] = ::File.join(node['pnp4nagios']['install_dir'], 'var')
default['pnp4nagios']['conf_dir'] = '/etc/pnp4nagios'
default['pnp4nagios']['log_dir'] = '/var/log/pnp4nagios'
default['pnp4nagios']['perf_data_dir'] = '/var/rrdtool/cache'
default['pnp4nagios']['rrd_stats_dir'] = '/var/rrdtool/stats'

default['pnp4nagios']['home_dir'] = '/var/lib/pnp4nagios'
default['pnp4nagios']['spool_dir'] = '/usr/local/nagios/var/spool'

default['pnp4nagios']['rrdtool'] = '/usr/bin/rrdtool'
default['pnp4nagios']['rrd_daemon_opts'] = nil

default['pnp4nagios']['manage_auth_file'] = false
default['pnp4nagios']['auth_file'] = ::File.join(node['pnp4nagios']['conf_dir'], 'pnp4nagios.users')

default['pnp4nagios']['nagios_base'] = '/nagios/cgi-bin'
default['pnp4nagios']['multisite_base_url'] = '/nagios'
default['pnp4nagios']['livestatus_socket'] = 'unix:/usr/local/nagios/var/rw/live'

default['pnp4nagios']['apache_modules'] = value_for_platform(
  %w(amazon debian ubuntu) => { 'default' => %w(default mod_python mod_php5 mod_cgi mod_ssl mod_rewrite mpm_prefork) },
  %w(centos redhat fedora) => { '>= 7.0' => %w(default mod_wsgi mod_php5 mod_cgi mod_ssl mod_rewrite),
                                'default' => %w(default mod_python mod_php5 mod_cgi mod_ssl mod_rewrite) }
)
