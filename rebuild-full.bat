call proxy-env.bat

SET DEVBOX_ALL_PACKAGES=true
SET BOX_NAME=arch-devbox-full

vagrant destroy -f
vagrant up %*
