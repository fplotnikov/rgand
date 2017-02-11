include_recipe 'jenkins::master'

xml = File.join(Chef::Config[:file_cache_path], 'web_config.xml')

# You could also use a `cookbook_file` or pure `file` resource to generate
# content at this path.
template xml do
  source 'web_config.xml'
end

# Create a jenkins job (default action is `:create`)
jenkins_job 'web_check' do
  config xml
end
