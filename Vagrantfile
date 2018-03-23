Vagrant.configure("2") do |config|
    config.vm.box = "archlinux/archlinux"
    config.vm.box_version = "2018.03.09"
    config.vm.provision :shell, :path => "scripts/setup.sh"
    config.vm.provision :shell, :path => "scripts/packages.sh"
    config.vm.provision :shell, :path => "scripts/locale.sh"
    config.vm.provision :shell, :path => "scripts/perso.sh"
    config.vm.network :forwarded_port, host: 8080, guest: 8080
    config.vm.network :forwarded_port, host: 9000, guest: 9000
    config.ssh.insert_key = true
    config.vm.synced_folder '.', '/vagrant', disabled: true

    config.vm.provider :virtualbox do |vb|
        vb.gui = true
        # Use VBoxManage to customize the VM. For example to change memory:
        vb.customize ["modifyvm", :id, "--name", "arch-devbox"]
        vb.customize ["modifyvm", :id, "--memory", "4096"]
        vb.customize ["modifyvm", :id, "--vram", 64]
        vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
        vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
        vb.customize ['modifyvm', :id, '--draganddrop', 'bidirectional']
    end
end
