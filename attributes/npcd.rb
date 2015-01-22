# npcd.cfg
default['pnp4nagios']['npcd']['log_type'] = 'file'
default['pnp4nagios']['npcd']['log_level'] = 0
default['pnp4nagios']['npcd']['max_log_file_size'] = 10_485_760

default['pnp4nagios']['npcd']['perfdata_run_cmd_args'] = '--bulk'
default['pnp4nagios']['npcd']['identify_npcd'] = 1
default['pnp4nagios']['npcd']['npcd_max_threads'] = 5
default['pnp4nagios']['npcd']['sleep_time'] = 15
default['pnp4nagios']['npcd']['load_threshold'] = 0.0
default['pnp4nagios']['npcd']['pid_file'] = '/var/run/npcd.pid'
default['pnp4nagios']['npcd']['perfdata_spool_filename'] = 'perfdata'
default['pnp4nagios']['npcd']['perfdata_file_processing_interval'] = 15
