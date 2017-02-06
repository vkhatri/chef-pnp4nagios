pnp4nagios CHANGELOG
====================

This file is used to list changes made in each version of the pnp4nagios cookbook.

0.2.9
-----

- Virender Khatri - Issue #8, set default value for default[pnp4nagios][rra]

- Virender Khatri - Issue #9, update pnp4nagios version to 0.6.25

- Virender Khatri - Added lint/tests

0.2.8
-----

- Virender Khatri - Fix for issue #7, updated apache2 modules

- Virender Khatri - Added source_url and issues_url

- Virender Khatri - Fix rubocop

0.2.7
-----

- Virender Khatri - #6, added ubuntu platform

- Virender Khatri - #5, added support for apache 2.4

0.2.5
-----

- Virender Khatri - added config node attributes

- Virender Khatri - added missing directory node[pnp4nagios][rrd_stats_dir] resource

- Virender Khatri - fixed lint errors


0.2.1
-----

- Virender Khatri - fix for #1, changed tmpdir location from /tmp


0.2.0
-----

- Virender Khatri - applied temp fix for rrdcache socket connect error

- Virender Khatri - added notify to files / templates resources

- Virender Khatri - default to nagios spool directory


0.1.5
-----

- Virender Khatri - fixed incorrect dir management for spool dir

- Virender Khatri - added rra.cfg file


0.1.2
-----

- Virender Khatri - Initial release of pnp4nagios

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
