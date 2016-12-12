#!/bin/bash
set -e

if [ ! -e '/var/www/html/version.php' ]; then
	tar cf - --one-file-system -C /usr/src/owncloud . | tar xf -
    chown -R www-data /var/www/html

    # Make not existing ./data/ for specified permission
	mkdir /var/www/html/data
    useradd aria2
    chown aria2:aria2 /var/www/html/data
    chmod 770 /var/www/html/data
    usermod -aG aria2 www-data
    usermod -aG www-data aria2

    # ocdownloader requirements
    su - aria2 -c '/usr/bin/aria2c --enable-rpc --rpc-allow-origin-all -c -D --log=/dev/stdout --check-certificate=false &'

    # makes aria2 and www-data works together
    umask 0007
fi

exec "$@"
