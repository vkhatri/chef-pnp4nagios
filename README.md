pnp4nagios Cookbook
================

[![Cookbook](https://img.shields.io/github/tag/vkhatri/chef-pnp4nagios.svg)](https://github.com/vkhatri/chef-pnp4nagios)[![Build Status](https://travis-ci.org/vkhatri/chef-pnp4nagios.svg?branch=master)](https://travis-ci.org/vkhatri/chef-pnp4nagios)

This is a [Chef] cookbook to manage [PNP4Nagios] using LWRP.


## Repository

https://github.com/vkhatri/chef-pnp4nagios


## Dependencies

- rrdtool
- apache2


## RRDTool / RRDCached

This cookbook does not manage rrdtool, instead utilize cookbook `rrdtool` to setup
`rrdcached` service.


## Recipes

- `pnp4nagios::default`      - default recipe (used for run_list)

- `pnp4nagios::install`      - install pnp4nagios

- `pnp4nagios::config`      - configures pnp4nagios

- `pnp4nagios::apache`      - install apache and manage pnp4nagios apache vhost


## Attributes

>> Cnofig Attributes are yet to be updated here. Kindly check attributes file for available attributes.

* `default['pnp4nagios']['version']` (default: `0.6.25`): pnp4nagios version

* `default['pnp4nagios']['source_url']` (default: ): pnp4nagios download source url

* `default['pnp4nagios']['user']` (default: `nagios`): pnp4nagios user

* `default['pnp4nagios']['group']` (default: `nagios`): pnp4nagios group

* `default['pnp4nagios']['perms']` (default: `0664`): pnp4nagios permissions

* `default['pnp4nagios']['users']['pnp4nagios']` (default: `pnp4nagios:pnp4nagios`): pnp4nagios default users

* `default['pnp4nagios']['manage_auth_file']` (default: `false`): whether to manage http auth file

* `default['pnp4nagios']['auth_file']` (default: `/etc/pnp4nagios/pnp4nagios.users`): auth file for /pnp4nagios

* `default['pnp4nagios']['source_dir']` (default: `/usr/local/src/pnp4nagios-x.y.z`): pnp4nagios source directory to install

* `default['pnp4nagios']['install_dir']` (default: `/usr/local/pnp4nagios`): pnp4nagios install directory

* `default['pnp4nagios']['tmp_dir']` (default: `/usr/local/pnp4nagios/tmpdir`): pnp4nagios install tmp directory

* `default['pnp4nagios']['var_dir']` (default: `/usr/local/pnp4nagios/var`): pnp4nagios var directory

* `default['pnp4nagios']['conf_dir']` (default: `/etc/pnp4nagios`): pnp4nagios configuration directory

* `default['pnp4nagios']['home_dir']` (default: `/var/lib/pnp4nagios`): pnp4nagios home/lib directory

* `default['pnp4nagios']['spool_dir']` (default: `/var/spool/icinga2/perfdata`): pnp4nagios spool directory for icinga/nagios performance data

* `default['pnp4nagios']['log_dir']` (default: `/var/log/pnp4nagios`): pnp4nagios log directory

* `default['pnp4nagios']['perf_data_dir']` (default: `/var/rrdtool/cache`): rrdcached / rrdtool cache directory

* `default['pnp4nagios']['rrd_listener']` (default: ``): pnp4nagios rrdtool / rrdcached listener / socket

* `default['pnp4nagios']['rrd_stats_dir']` (default: `/var/rrdtool/stats`): rrdtool stats dir

* `default['pnp4nagios']['use_rrds']` (default: `0`):

* `default['pnp4nagios']['nagios_base']` (default: `/nagios/cgi-bin`): nagios / icinga cgi-bin base http url

* `default['pnp4nagios']['multisite_base_url']` (default: `/nagios`): nagios / icinga base url

* `default['pnp4nagios']['livestatus_socket']` (default: `unix:/usr/local/nagios/var/rw/live`): nagios / icinga livestatus socket

* `default['pnp4nagios']['log_type']` (default: `file`): pnp4nagios log type

* `default['pnp4nagios']['log_level']` (default: `0`): pnp4nagios log level

* `default['pnp4nagios']['max_log_file_size']` (default: `10485760`): pnp4nagios max log size

* `default['pnp4nagios']['perfdata_run_cmd_args']` (default: `--bulk`): pnp4nagios perfdata args for npcd

* `default['pnp4nagios']['npcd_max_threads']` (default: `5`): npcd process threads

* `default['pnp4nagios']['npcd_sleep_time']` (default: `15`): npcd process sleep time

* `default['pnp4nagios']['perfdata_file_processing_interval']` (default: `15`): perfdata processing interval


## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests (`rake`), ensuring they all pass
6. Write new resource/attribute description to `README.md`
7. Write description about changes to PR
8. Submit a Pull Request using Github


## Copyright & License

Authors:: Virender Khatri and [Contributors]

<pre>
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
</pre>


[Chef]: https://www.chef.io/
[PNP4Nagios]: https://docs.pnp4nagios.org/
[Contributors]: https://github.com/vkhatri/chef-pnp4nagios/graphs/contributors
