Vagrant.configure(2) do |config|
  # export VAGRANT_DEFAULT_PROVIDER=virtualbox
  config.vm.define "guide" do |g|
    g.vm.box = "bento/ubuntu-14.04"
    g.vm.provider "virtualbox"
    g.vm.network :forwarded_port, guest: 1948, host: 1948
    g.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y npm phantomjs
      npm config set registry
      npm install reveal-md
      for each in /vagrant/docs/*.md; do cat $each; echo -e "\n---\n"; done > index.md
      echo -e "# Thanks\!\nChef's Partner Engineering Team\n\n<partnereng@chef.io>" >> index.md
      nodejs ./node_modules/.bin/reveal-md index.md --theme night --print cookbook-guide.pdf
      echo -e "\n[Download PDF of the slides](cookbook-guide.pdf)" >> index.md
      nodejs ./node_modules/.bin/reveal-md index.md --theme night
     SHELL
  end

end
