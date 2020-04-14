#
# Cookbook:: itjobs
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

apt_update 'update_sources' do
  action :update
end

execute 'install python' do
  command 'sudo apt-get install python3.7 -y'
  action :run
end

execute 'python3-pip' do
  command 'sudo apt install python3-pip -y'
  action :run
end

template '/templates/requirements' do
  source 'requirements.txt.erb'
  mode '0440'
  owner 'root'
  group 'root'
end

remote_directory '/home/vagrant/app' do
  source 'app'
  action :create
end


package 'python3.7' do
  action :install
end

package 'python3-pip' do
  options '--allow-unauthenticated'
  action :install
end

execute 'install bs4' do
  command 'pip3 install bs4'
  action :run
end

execute 'install requests' do
  command 'pip3 install requests'
  action :run
end

execute 'install pytest' do
  command 'pip3 install pytest'
  action :run
end

# directory '/home/vagrant/Downloads' do
#   owner 'root'
#   group 'root'
#   action :create
#   mode '0777'
# end

package 'python3-pip'

remote_directory '/home/ubuntu/app' do
  source 'app'
  owner 'root'
  group 'root'
  mode '0777'
  action :create
end

bash 'pip install requirements.txt' do
  code <<-EOL
  pip3 install -r /home/ubuntu/app/requirements.txt
  EOL
end

directory '/home/ubuntu/Downloads' do
  owner 'root'
  group 'root'
  action :create
  mode '0777'
end

bash 'install_jenkins' do
  code <<-EOH
  echo "Adding apt-keys"
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb http://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
echo "Updating apt-get"
sudo apt-get -qq update
echo "Installing default-java"
sudo apt-get -y install default-jre > /dev/null 2>&1
sudo apt-get -y install default-jdk > /dev/null 2>&1
echo "Installing git"
sudo apt-get -y install git > /dev/null 2>&1
echo "Installing git-ftp"
sudo apt-get -y install git-ftp > /dev/null 2>&1
echo "Installing jenkins"
sudo apt-get -y install jenkins > /dev/null 2>&1
  EOH
end
