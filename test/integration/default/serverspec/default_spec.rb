require 'spec_helper'

# epel needs to exist if not fedora
if os[:family] != 'fedora'
  describe yumrepo('epel') do
    it { should exist }
  end

  describe yumrepo('epel') do
    it { should be_enabled }
  end
end

# mock package should be installed
describe package('mock') do
  it { should be_installed }
end

# mock plugin packages should not be installed
describe command('rpm -qa --queryformat \'%{NAME}\n\' | grep -P \'^mock-.*$\'') do
  its(:exit_status) { should eq 1 }
end

# mock group created by mock package
describe group('mock') do
  it { should exist }
end

# mock group should not contain any users
describe command('getent group mock | cut -d : -f 4') do
  its(:stdout) { should match(/^$/) }
end
