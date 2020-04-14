
require 'spec_helper'

describe 'itjobs::default' do

  context 'When all attributes are default, on Ubuntu 18.04' do

    platform 'ubuntu', '18.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'should run apt-get update' do
      expect(chef_run).to update_apt_update 'update_sources'
    end

    it 'should install python' do
      expect(chef_run).to install_package 'python3.7'
    end

    it 'should install pip' do
      expect(chef_run).to install_package 'python3-pip'
    end

    it 'should install bs4 using pip installer' do
      expect(chef_run).to run_execute('install bs4')
    end

    it 'should install requests using pip installer' do
      expect(chef_run).to run_execute('install requests')
    end

    it 'should install pytest using pip installer' do
      expect(chef_run).to run_execute('install pytest')
    end

    it 'should create Downloads directory' do
      expect(chef_run).to create_directory('/home/vagrant/Downloads')
    end




  end


end
