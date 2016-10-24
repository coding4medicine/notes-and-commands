# Loading usb disk

diskinfo (to get the name of usb partition)

rmformat (???)

mount -F pcfs /dev/dsk/c2t0d0p0:c /mnt

Make sure to add ":c", not any other letter.

umount /mnt


