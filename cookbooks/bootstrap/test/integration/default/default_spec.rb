# encoding: utf-8
# author: JJ Asghar

describe package('npm') do
  it { should be_installed }
end

describe package('daemon') do
  it { should be_installed }
end

describe package('phantomjs') do
  it { should be_installed }
end

describe port(1948) do
  it { should be_listening }
  its('protocols') {should include 'tcp'}
end

describe directory('/home/vagrant/cookbook-guide/.git') do
  it { should be_directory }
end
