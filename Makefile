default: r_virtualbox-guest-utils-nox i_virtualbox-guest-utils\ virtualbox-guest-modules-arch
	@sudo systemctl enable vboxservice
	@sudo systemctl start vboxservice
	@sudo gpasswd -a ${USER} vboxsf

r_%:
	@sudo pacman -R $* --noconfirm || true

s_%:
	@stow -t "${HOME}" -v -R "$*"

i_%:
	@echo "Installing package(s) $*"
	@yay -S $* --noconfirm --needed
