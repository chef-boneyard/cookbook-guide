#
# Cookbook Name:: bootstrap
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'bootstrap::default' do

  context 'When all attributes are default, on an unspecified platform' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'Copy reveal.json to /tmp' do
      expect(chef_run).to run_execute('Copy reveal.json to /tmp')
    end

    it 'Get the markdowns to the correct location' do
      expect(chef_run).to run_execute('Get the markdowns to the correct location')
    end

    it 'Update the apt-cache' do
      expect(chef_run).to run_execute('Update the apt-cache')
    end

    it 'installs phantomjs' do
      expect(chef_run).to install_package('phantomjs')
    end

    it 'installs npm' do
      expect(chef_run).to install_package('npm')
    end

    it 'installs daemon' do
      expect(chef_run).to install_package('daemon')
    end

    it 'install reveal-md' do
      expect(chef_run).to run_execute('install reveal-md')
    end

    it 'copies the chef.css to the correct location' do
      expect(chef_run).to run_execute('Copy the chef.css to the correct location')
    end

    it 'Copy the chef.css for reveal.js' do
      expect(chef_run).to run_execute('Copy the chef.css for reveal.js')
    end

    it 'starts the nodeprinter service' do
      expect(chef_run).to start_service('nodeprinter')
    end

    it 'starts the nodeserver service' do
      expect(chef_run).to start_service('nodeserver')
    end

    it 'enables the nodeprinter service' do
      expect(chef_run).to enable_service('nodeprinter')
    end

    it 'enables the nodeserver service' do
      expect(chef_run).to enable_service('nodeserver')
    end

    it 'creates /etc/init.d/nodeserver' do
      expect(chef_run).to create_cookbook_file('/etc/init.d/nodeserver')
    end

    it 'creates /etc/init.d/nodeprinter' do
      expect(chef_run).to create_cookbook_file('/etc/init.d/nodeprinter')
    end

    it 'runs a bash script (set up npm)' do
      expect(chef_run).to run_bash('set up npm')
    end

    it 'runs a bash script (Adding some notes)' do
      expect(chef_run).to run_bash('Adding some notes')
    end

    it 'writes the log note' do
      expect(chef_run).to write_log('Open up http://127.0.0.1:1948/index.md in a web browser and you are in the presentation.')
    end
  end
end
