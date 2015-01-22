
default['pnp4nagios']['config']['use_url_rewriting'] = 1

default['pnp4nagios']['config']['zgraph_width'] = 500
default['pnp4nagios']['config']['zgraph_height'] = 100

default['pnp4nagios']['config']['right_zoom_offset'] = 30

default['pnp4nagios']['config']['graph_width'] = 500
default['pnp4nagios']['config']['graph_height'] = 100

default['pnp4nagios']['config']['pdf_width'] = 675
default['pnp4nagios']['config']['pdf_height'] = 100
default['pnp4nagios']['config']['pdf_page_size'] = 'A4'
default['pnp4nagios']['config']['pdf_margin_top'] = 30
default['pnp4nagios']['config']['pdf_margin_left'] = 17.5
default['pnp4nagios']['config']['pdf_margin_right'] = 10

default['pnp4nagios']['config']['refresh'] = 60
default['pnp4nagios']['config']['temp'] = '/var/tmp'

default['pnp4nagios']['config']['graph_opt'] = nil
default['pnp4nagios']['config']['pdf_graph_opt'] = nil

default['pnp4nagios']['config']['max_age'] = '60*60*6'

default['pnp4nagios']['config']['overview_range'] = 1
default['pnp4nagios']['config']['popup_width'] = '300px'

default['pnp4nagios']['config']['ui_theme'] = 'smoothness'
default['pnp4nagios']['config']['lang'] = 'en_US'
default['pnp4nagios']['config']['date_fmt'] = 'd.m.y G:i'
default['pnp4nagios']['config']['enable_recursive_template_search'] = 1
default['pnp4nagios']['config']['show_xml_icon'] = 1
default['pnp4nagios']['config']['use_fpdf'] = 1
default['pnp4nagios']['config']['use_calendar'] = 1

default['pnp4nagios']['config']['multisite_base_url'] = '/check_mk'
default['pnp4nagios']['config']['multisite_site'] = nil

default['pnp4nagios']['config']['auth_enabled'] = 'FALSE'
default['pnp4nagios']['config']['allowed_for_all_services'] = []
default['pnp4nagios']['config']['allowed_for_all_hosts'] = []

# defaults config, set attribute value to disable and
# add required views
default['pnp4nagios']['config']['views']['one_hour'] = false
default['pnp4nagios']['config']['views']['three_hours'] = false
default['pnp4nagios']['config']['views']['four_hours'] = true
default['pnp4nagios']['config']['views']['six_hours'] = false
default['pnp4nagios']['config']['views']['twelve_hours'] = false
default['pnp4nagios']['config']['views']['twenty_four_hours'] = false
default['pnp4nagios']['config']['views']['twenty_five_hours'] = true
default['pnp4nagios']['config']['views']['one_week'] = true
default['pnp4nagios']['config']['views']['two_weeks'] = false
default['pnp4nagios']['config']['views']['one_month'] = true
default['pnp4nagios']['config']['views']['three_months'] = false
default['pnp4nagios']['config']['views']['six_months'] = false
default['pnp4nagios']['config']['views']['one_year'] = true

default['pnp4nagios']['config']['allowed_for_service_links'] = %w(EVERYONE)
default['pnp4nagios']['config']['allowed_for_host_search'] = %w(EVERYONE)
default['pnp4nagios']['config']['allowed_for_host_overview'] = %w(EVERYONE)
default['pnp4nagios']['config']['allowed_for_pages'] = %w(EVERYONE)

default['pnp4nagios']['config']['nagios_base'] = '/nagios/cgi-bin'
default['pnp4nagios']['config']['multisite_base_url'] = '/nagios'
default['pnp4nagios']['config']['livestatus_socket'] = 'unix:/usr/local/nagios/var/rw/live'

default['pnp4nagios']['config']['mobile_devices'] = 'iPhone|iPod|iPad|android'
