# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANT_COMMAND = ARGV[0]
if VAGRANT_COMMAND == 'ssh'
#  config.ssh.username = ENV['USERNAME']
end

use_proxy = ENV.key?('HTTP_PROXY')
use_all = ENV.key?('DEVBOX_ALL_PACKAGES')

Vagrant.configure('2') do |config|
    config.vm.box = 'archlinux/archlinux'
    config.vm.box_version = '2018.03.09'


    config.vm.provision 'file', source: '~/.ssh/id_rsa', destination: '~/.ssh/id_rsa'

    config.vm.provision 'shell', path: 'scripts/setup.sh'
    config.vm.provision 'shell', path: 'scripts/proxy.sh' if use_proxy
    config.vm.provision 'shell', path: 'scripts/pacman_yaourt.sh'
    config.vm.provision 'shell', path: 'scripts/install_std.sh', privileged: false
    config.vm.provision 'shell', path: 'scripts/locale.sh'
    config.vm.provision 'shell', path: 'scripts/perso.sh', privileged: false
    config.vm.provision 'shell', path: 'scripts/install_long.sh', privileged: false if use_all

    config.vm.network :forwarded_port, host: 8080, guest: 8080
    config.vm.network :forwarded_port, host: 9000, guest: 9000

    config.ssh.insert_key = true
    config.vm.synced_folder '.', '/vagrant', disabled: true

    config.vm.provider 'virtualbox' do |vb|
        vb.gui = true
        vb.cpus = 2
        vb.memory = 4096
        vb.customize ['modifyvm', :id, '--name', 'arch-devbox']
        vb.customize ['modifyvm', :id, '--vram', 64]
        vb.customize ['modifyvm', :id, '--accelerate3d', 'on']
        vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
        vb.customize ['modifyvm', :id, '--draganddrop', 'bidirectional']
        vb.customize ['modifyvm', :id, '--accelerate2dvideo', 'off']
        vb.customize ['setextradata', :id, 'GUI/SuppressMessages',
                      'remindAboutAutoCapture,remindAboutWrongColorDepth,remindAboutMouseIntegrationOn,remindAboutMouseIntegrationOff,confirmInputCapture,confirmGoingFullscreen']
    end
end
