# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANT_COMMAND = ARGV[0]
if VAGRANT_COMMAND == 'ssh'
#  config.ssh.username = ENV['USERNAME']
end

use_proxy = ENV.key? 'HTTP_PROXY'
use_all = ENV.key? 'DEVBOX_ALL_PACKAGES'
box_name = ENV.fetch 'BOX_NAME', 'arch-devbox'

if use_proxy
    proxy_env = {
        'PROXY_SERVER' => ENV['PROXY_SERVER'],
        'PROXY_PORT' => ENV['PROXY_PORT'],
        'NO_PROXY' => ENV['NO_PROXY'],
        'PROXY_PAC' => ENV['PROXY_PAC']
    }
end

Vagrant.configure('2') do |config|
    config.vm.box = 'archlinux/archlinux'
    config.vm.box_version = '2018.06.05'


    config.vm.provision 'file', source: '~/.ssh/id_rsa', destination: '~/.ssh/id_rsa'

    config.vm.provision 'shell', path: 'scripts/setup.sh'
    config.vm.provision 'shell', path: 'scripts/proxy.sh', env: proxy_env if use_proxy
    config.vm.provision 'shell', path: 'scripts/aurman.sh', privileged: false
    config.vm.provision 'shell', path: 'scripts/install_std.sh', privileged: false
    config.vm.provision 'shell', path: 'scripts/locale.sh'
    config.vm.provision 'shell', path: 'scripts/perso.sh', privileged: false
    config.vm.provision 'shell', path: 'scripts/install_long.sh', privileged: false if use_all
    config.vm.provision 'shell', path: 'scripts/install_intellij.sh', privileged: false if use_all
    config.vm.provision 'shell', path: 'scripts/proxy_last.sh', privileged: false, env: proxy_env if use_proxy

    # config.vm.network :forwarded_port, host: 8080, guest: 8080
    # config.vm.network :forwarded_port, host: 9000, guest: 9000

    config.ssh.insert_key = true
    config.vm.synced_folder '.', '/vagrant', disabled: true

    config.vm.provider 'virtualbox' do |vb|
        vb.gui = true
        vb.cpus = 3
        vb.memory = 8192
        vb.customize ['modifyvm', :id, '--name', box_name]
        vb.customize ['modifyvm', :id, '--vram', 64]
        vb.customize ['modifyvm', :id, '--accelerate3d', 'on']
        vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
        vb.customize ['modifyvm', :id, '--draganddrop', 'bidirectional']
        vb.customize ['modifyvm', :id, '--accelerate2dvideo', 'off']
        vb.customize ['setextradata', :id, 'GUI/SuppressMessages',
                      'remindAboutAutoCapture,remindAboutWrongColorDepth,remindAboutMouseIntegrationOn,remindAboutMouseIntegrationOff,confirmInputCapture,confirmGoingFullscreen']
    end
end
