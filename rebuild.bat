call proxy-env.bat
SET DEVBOX_ALL_PACKAGES=
SET BOX_NAME=arch-devbox-mini

vagrant destroy -f
vagrant up %*
