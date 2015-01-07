default['pnp4nagios']['version'] = '0.6.24'

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

# home dir for various run time directories / files
default['pnp4nagios']['home_dir'] = '/var/lib/pnp4nagios'
default['pnp4nagios']['spool_dir'] = '/usr/local/nagios/var/spool'

# npcd.cfg
default['pnp4nagios']['perfdata_run_cmd_args'] = '--bulk'
default['pnp4nagios']['npcd_max_threads'] = 5
default['pnp4nagios']['npcd_sleep_time'] = 15
default['pnp4nagios']['perfdata_file_processing_interval'] = 15

default['pnp4nagios']['manage_auth_file'] = false
default['pnp4nagios']['auth_file'] = ::File.join(node['pnp4nagios']['conf_dir'], 'pnp4nagios.users')

default['pnp4nagios']['log_dir'] = '/var/log/pnp4nagios'
default['pnp4nagios']['log_type'] = 'file'
default['pnp4nagios']['log_level'] = '0'
default['pnp4nagios']['max_log_file_size'] = '10485760'

default['pnp4nagios']['perf_data_dir'] = '/var/rrdtool/cache'
default['pnp4nagios']['rrd_listener'] = nil
default['pnp4nagios']['rrd_stats_dir'] = '/var/rrdtool/stats'

default['pnp4nagios']['use_rrds'] = 0
default['pnp4nagios']['nagios_base'] = '/nagios/cgi-bin'
default['pnp4nagios']['multisite_base_url'] = '/nagios'
default['pnp4nagios']['livestatus_socket'] = 'unix:/usr/local/nagios/var/rw/live'

default['pnp4nagios']['rra_step'] = 60
default['pnp4nagios']['rra'] = [] # %w(RRA:AVERAGE:0.5:1:2880 RRA:AVERAGE:0.5:5:2880 RRA:AVERAGE:0.5:30:4320 RRA:AVERAGE:0.5:360:5840 RRA:MAX:0.5:1:2880 RRA:MAX:0.5:5:2880 RRA:MAX:0.5:30:4320 RRA:MAX:0.5:360:5840 RRA:MIN:0.5:1:2880 RRA:MIN:0.5:5:2880 RRA:MIN:0.5:30:4320 RRA:MIN:0.5:360:5840)
