package 'httpd' do
  action [:install]
end

file '/var/www/html/index.html' do
  content '<h1> Hello World </h1>'
end

service 'httpd' do
  action [:start, :enable]
end
