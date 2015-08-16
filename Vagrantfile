script = <<SCRIPT
# Install Packages
apt-get install -y \
  emacs24-nox \
  git \
  git-flow

# Install RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby

# Put ruby on Path for Rest of Installation
source /usr/local/rvm/scripts/rvm

# Print ruby Version
ruby -v

# Install Bundler
gem install bundler

# Install Docker
#  https://docs.docker.com/installation/ubuntulinux/
wget -qO- https://get.docker.com/ | sh

# Configure Kitchen to use Kitchen-Docker within Vagrant
su -c "echo >> ~/.bashrc" vagrant
su -c "echo '# Modify Vagrant to use Kitchen-Docker' >> ~/.bashrc" vagrant
su -c "echo 'export KITCHEN_YAML=.kitchen.docker.yml' >> ~/.bashrc" vagrant

# Configure git Environment
su -c "git config --global push.default simple" vagrant

# Install Needed Gems
su -l -c "cd /vagrant; bundle install" vagrant
SCRIPT

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/trusty64'

  config.vm.provider 'virtualbox' do |v|
    v.memory = 4096
    v.cpus = 2
  end

  config.vm.provision 'shell', inline: script
end
