# gulpegaspe-os

## Locale
localectl list-locales | grep it_ \
sudo localectl set-locale LANG=it_IT.UTF-8

## Keymap
localectl list-keymaps | grep it
sudo localectl set-keymap it

## Timezone
timedatectl list-timezones | grep -i rome
sudo timedatectl set-timezone Europe/Rome
