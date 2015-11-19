Vagrant.configure(2) do |config|
  # export VAGRANT_DEFAULT_PROVIDER=virtualbox
  config.vm.define "guide" do |g|
    g.vm.box = "bento/ubuntu-14.04"
    g.vm.provider "virtualbox"
    g.vm.network :forwarded_port, guest: 1948, host: 1948
    g.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y phantomjs npm
      npm config set registry
      npm install reveal-md
      cp /vagrant/docs/theme/chef.css /home/vagrant/node_modules/reveal-md/node_modules/reveal.js/css/theme/
      cp /vagrant/docs/theme/chef.css /home/vagrant/node_modules/reveal-md/node_modules/reveal.js/css/theme/source/
      cp /vagrant/docs/reveal.json /tmp/
      for each in /vagrant/docs/*.md; do cat $each; echo -e "\n---\n"; done > /tmp/index.md
      echo -e "# Thanks\!\nChef's Partner Engineering Team\n\n<partnereng@chef.io>" >> /tmp/index.md
      sleep 5
      nodejs ./node_modules/.bin/reveal-md /tmp/index.md --theme chef --print /tmp/cookbook-guide.pdf
      echo -e "\n[Download PDF of the slides](cookbook-guide.pdf)" >> /tmp/index.md
      nodejs ./node_modules/.bin/reveal-md /tmp/index.md --theme chef
     SHELL
  end

end
