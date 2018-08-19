#
# Cookbook Name:: apache
# Recipe:: server
#
# Copyright (c) 2018 The Authors, All Rights Reserved.

package 'httpd' do
  action [:install]
end

file '/var/www/html/index.html' do
  content "<h1> Welcome to Chef </h1>
  Hostname: #{node['hostname']}
  Ipaddress: #{node['ipaddress']}"
end

service 'httpd' do
  action [:enable, :start]
end
