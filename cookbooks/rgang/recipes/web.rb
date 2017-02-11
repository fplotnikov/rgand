include_recipe 'apache2::mod_rewrite'
include_recipe 'apache2::mod_status'


web_app 'web_srv' do
  server_name node['ipaddress']
  server_aliases [node['fqdn']]
  docroot '/var/www/html'
  cookbook 'apache2'
  template 'default-site.conf.erb'
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  owner 'root'
  group 'root'
  mode 00644
end
