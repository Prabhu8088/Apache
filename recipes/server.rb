#
# Cookbook Name:: apache
# Recipe:: server
#
# Copyright (c) 2018 The Authors, All Rights Reserved.

package 'httpd' do
  action [:install]
end

remote_file '/var/www/html/prabhu.jpg' do
  source 'http://wall2born.com/data/out/250/image-44549561-high-definition-wallpapers-of-nature.jpg'
end

user 'Prabhu' do
  comment 'He is the Admin'
  uid '1234'
  home '/etc/passwd'
  shell '/bin/bash'
end

execute 'run a sample script' do
  user 'root'
  command '/home/centos/chef/cookbooks/Shell_scripts/sample.sh'
  only_if do
    File.directory?('/var/www/html')
  end
end


template '/var/www/html/index.html' do
  source 'index.html.erb'
end

service 'httpd' do
  action [:enable, :start]
  subscribes :restart,'template[/var/www/html/index.html]',:immediately
end
