#
#
# The bootstrap script for the cookbook-guide
#
#
# What're you looking at? I know what I'm doing.
#                          - Han Solo
#

execute 'curl -sL https://deb.nodesource.com/setup_5.x | sudo bash -'

execute "Update the apt-cache" do
  command "sudo apt-get update"
  action :run
end

%w{nodejs phantomjs daemon git build-essential}.each do |pkg|
  package pkg do
    action [:install]
  end
end

cookbook_file "/tmp/reveal.json" do
  owner "vagrant"
  mode "0644"
  source "reveal.json"
end

git "/home/vagrant/cookbook-guide" do
  repository "https://github.com/chef-partners/cookbook-guide.git"
  reference "master"
  action :checkout
end

execute "Get the markdowns to the correct location" do
  cwd "/home/vagrant"
  user "vagrant"
  command 'for each in /home/vagrant/cookbook-guide/docs/*.md; do cat $each; echo "\n---\n"; done > /tmp/index.md'
  creates "/tmp/index.md"
  action :run
end

execute "install reveal-md" do
  cwd "/home/vagrant"
  creates "/usr/bin/reveal-md"
  command "npm install -g reveal-md"
  action :run
end

execute "install phantomjs" do
  cwd "/home/vagrant"
  creates "/usr/bin/phantomjs"
  command "npm install -g phantomjs"
  action :run
end

execute "Copy the chef.css to the correct location" do
  command "cp /home/vagrant/cookbook-guide/docs/theme/chef.css /usr/lib/node_modules/reveal-md/node_modules/reveal.js/css/theme/"
  creates "/usr/lib/node_modules/reveal-md/node_modules/reveal.js/reveal.js/css/theme/chef.css"
  action :run
end

execute "Copy the chef.css for reveal.js" do
  command "cp /home/vagrant/cookbook-guide/docs/theme/chef.css /usr/lib/node_modules/reveal-md/node_modules/reveal.js/css/theme/source"
  creates "/usr/lib/node_modules/reveal-md/node_modules/reveal.js/reveal.js/css/theme/source/chef.css"
  action :run
end

bash "Adding some notes" do
  user "vagrant"
  cwd "/home/vagrant"
  code <<-EOH
    STATUS=0
    echo -e "# Thanks\!\nChef's Partner Engineering Team\n\n<partnereng@chef.io>" >> /tmp/index.md  || STATUS=1
    echo -e "\n[Download PDF of the slides](cookbook-guide.pdf)" >> /tmp/index.md  || STATUS=1
    exit $STATUS
  EOH
end

directory "/var/log/nodejs" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

cookbook_file "/etc/init.d/nodeserver" do
  mode 755
  source "nodeserver"
end

execute "create pdf" do
  cwd "/tmp/"
  creates "/tmp/cookbook-guide.pdf"
  command "reveal-md /tmp/index.md --print cookbook-guide.pdf"
  action :run
end

service "nodeserver" do
  supports restart: true, start: true, stop: true, reload: true
  action [:enable, :start]
end

log 'Notice to user' do
  message "\n\n##############################################################################\nOpen up http://127.0.0.1:1948/index.md in a web browser and you are in the presentation. \n##############################################################################"
  level :info
end
