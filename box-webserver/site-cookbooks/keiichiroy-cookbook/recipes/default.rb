# install some yum packages
install_packages = ["httpd"]
install_packages.each do |pkg|
  yum_package "#{pkg}" do
    action :install
  end
end

# register/start httpd service
service "httpd" do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end