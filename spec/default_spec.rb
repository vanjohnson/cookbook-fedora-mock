require 'spec_helper'

describe 'fedora-mock' do
  shared_context 'installs the correct packages' do
    it 'installs the correct packages' do
      expect(chef_run).to install_package(:mock)
    end
  end

  shared_context 'should not include EPEL' do
    it 'should not include EPEL' do
      expect(chef_run).to_not include_recipe('yum-epel')
    end
  end

  context 'by default on non-Fedora distributions' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new
        .converge(described_recipe)
    end

    it 'should include EPEL' do
      expect(chef_run).to include_recipe('yum-epel')
    end

    include_context 'installs the correct packages'

    it 'group mock should be under Chef management' do
      expect(chef_run).to modify_group(:mock).with(members: [])

      expect(chef_run.group(:mock)).to notify('execute[newgrp]').to(:run)
        .immediately

      expect(chef_run.execute(:newgrp)).to do_nothing
    end
  end

  context 'when on Fedora' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'fedora', version: '19')
        .converge(described_recipe)
    end

    include_context 'should not include EPEL'

    include_context 'installs the correct packages'
  end

  context 'when disabling EPEL' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.set['fedora-mock']['enable-epel'] = false
      end.converge(described_recipe)
    end

    include_context 'should not include EPEL'
  end

  context 'when specifying plugins' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.set['fedora-mock']['plugins']['scm'] = true
      end.converge(described_recipe)
    end

    it 'installs the correct plugins' do
      expect(chef_run).to install_package(:'mock-scm')
    end
  end
end
