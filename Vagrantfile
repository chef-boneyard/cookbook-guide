Vagrant.configure(2) do |config|
  # export VAGRANT_DEFAULT_PROVIDER=virtualbox
  config.vm.define "guide" do |g|
    g.vm.box = "bento/ubuntu-14.04"
    g.vm.provider "virtualbox"
    g.vm.synced_folder ".", "/vagrant"
    g.vm.network :forwarded_port, guest: 1948, host: 1948
    g.vm.provision "chef_zero" do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.nodes_path = "nodes"
    end
  end
end
