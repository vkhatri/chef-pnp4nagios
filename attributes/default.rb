
default['pnp4nagios']['version'] = '0.6.24'

# owner / group
default['pnp4nagios']['user'] = 'nagios'
default['pnp4nagios']['group'] = 'nagios'

default['pnp4nagios']['source_url'] = "http://downloads.sourceforge.net/project/pnp4nagios/PNP-0.6/pnp4nagios-#{node['icinga2']['pnp']['version']}.tar.gz"

default['pnp4nagios']['source_dir'] = "/usr/local/src/pnp4nagios-#{node['icinga2']['pnp']['version']}"
default['pnp4nagios']['install_dir'] = '/usr/local/pnp4nagios'
default['pnp4nagios']['conf_dir'] = '/etc/pnp4nagios'

# home dir for various run time directories / files
default['pnp4nagios']['home_dir'] = '/var/lib/pnp4nagios'
default['pnp4nagios']['data_dir'] = ::File.join(node['pnp4nagios']['home_dir'], 'perfdata')
default['pnp4nagios']['spool_dir'] = ::File.join(node['pnp4nagios']['home_dir'], 'spool')

# nagios / icinga perf data configuration
default['pnp4nagios']['service_data_dir'] = '/usr/local/pnp4nagios/service-perfdata'
default['pnp4nagios']['service_data_file_template'] = 'DATATYPE::SERVICEPERFDATA\tTIMET::$TIMET$\tHOSTNAME::$HOSTNAME$\tSERVICEDESC::$SERVICEDESC$\tSERVICEPERFDATA::$SERVICEPERFDATA$\tSERVICECHECKCOMMAND::$SERVICECHECKCOMMAND$\tHOSTSTATE::$HOSTSTATE$\tHOSTSTATETYPE::$HOSTSTATETYPE$\tSERVICESTATE::$SERVICESTATE$\tSERVICESTATETYPE::$SERVICESTATETYPE$'
default['pnp4nagios']['host_data_dir'] = '/usr/local/pnp4nagios/host-perfdata'
default['pnp4nagios']['host_data_file_template'] = 'DATATYPE::HOSTPERFDATA\tTIMET::$TIMET$\tHOSTNAME::$HOSTNAME$\tHOSTPERFDATA::$HOSTPERFDATA$\tHOSTCHECKCOMMAND::$HOSTCHECKCOMMAND$\tHOSTSTATE::$HOSTSTATE$\tHOSTSTATETYPE::$HOSTSTATETYPE$'

# npcd configuration
default['pnp4nagios']['perfdata_run_cmd_args'] = '--bulk'
default['pnp4nagios']['npcd_max_threads'] = 5
default['pnp4nagios']['npcd_max_threads'] = 15
default['pnp4nagios']['perfdata_file_processing_interval'] = 15
default['pnp4nagios']['host_data_processing_interval'] = 15
default['pnp4nagios']['service_data_processing_interval'] = 15

default['pnp4nagios']['auth_file'] = ::File.join(node['pnp4nagios']['conf_dir'], 'htpasswd.users')

default['pnp4nagios']['log_dir'] = '/var/log/pnp4nagios'
default['pnp4nagios']['log_type'] = 'file'
default['pnp4nagios']['log_level'] = '0'
default['pnp4nagios']['max_log_file_size'] = '10485760'

