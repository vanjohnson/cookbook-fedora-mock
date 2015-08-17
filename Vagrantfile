script = <<SCRIPT
# Install Needed Gems
su -l -c "cd /vagrant; export USE_SYSTEM_GECODE=1; bundle install --binstubs" vagrant
SCRIPT

Vagrant.configure('2') do |config|
  config.vm.box = 'st-isidore-de-seville/trusty64-rvm-docker'

  config.vm.provider 'virtualbox' do |v|
    v.memory = 512
    v.cpus = 1
  end

  config.vm.provision 'shell', inline: script
end
