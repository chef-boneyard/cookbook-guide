#
#
# The bootstrap script for the cookbook-guide
#
#
# What're you looking at? I know what I'm doing.
#                          - Han Solo
#

execute "Update the apt-cache" do
  command "sudo apt-get update"
  action :run
end

%w{phantomjs npm daemon git}.each do |pkg|
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

bash "set up npm" do
  creates "maybe"
  code <<-EOH
    STATUS=0
    npm config set registry || STATUS=1
    exit $STATUS
  EOH
end

execute "install reveal-md" do
  cwd "/home/vagrant"
  creates "/usr/local/bin/reveal-md"
  command "npm install -g reveal-md"
  action :run
end

execute "Copy the chef.css to the correct location" do
  command "cp /home/vagrant/cookbook-guide/docs/theme/chef.css /usr/local/lib/node_modules/reveal-md/node_modules/reveal.js/css/theme/"
  creates "/usr/local/lib/node_modules/reveal-md/node_modules/reveal.js/reveal.js/css/theme/chef.css"
  action :run
end

execute "Copy the chef.css for reveal.js" do
  command "cp /home/vagrant/cookbook-guide/docs/theme/chef.css /usr/local/lib/node_modules/reveal-md/node_modules/reveal.js/css/theme/source"
  creates "/usr/local/lib/node_modules/reveal-md/node_modules/reveal.js/reveal.js/css/theme/source/chef.css"
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

cookbook_file "/etc/init.d/nodeserver" do
  mode 755
  source "nodeserver"
end

cookbook_file "/etc/init.d/nodeprinter" do
  mode 755
  source "nodeprinter"
end

service "nodeprinter" do
  supports restart: true, start: true, stop: true, reload: true
  action [:enable, :start]
end

service "nodeserver" do
  supports restart: true, start: true, stop: true, reload: true
  action [:enable, :start]
end

log "Open up http://127.0.0.1:1948/index.md in a web browser and you are in the presentation."
