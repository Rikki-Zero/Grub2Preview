previewer = ./previewer
iso-pack-path = $(previewer)/iso
iso-path = $(previewer)/grub.iso
test-theme = $(previewer)/iso/boot/test-theme
theme-path = ./theme
g2p-file = $(theme-path)/.grub2preview
true-path = $(shell cat $(g2p-file))

preview: make-iso
	@qemu-system-x86_64 -boot d -cdrom $(iso-path) \
		-accel kvm -cpu kvm64 -m 256M \
		-display gtk,gl=on

clean-theme:
	rm -r $(test-theme)
	mkdir $(test-theme)

copy-theme: clean-theme
	cp -r $(theme-path)/$(true-path)/* $(test-theme)

make-iso: copy-theme
	@grub-mkrescue -o $(previewer)/grub.iso $(iso-pack-path)