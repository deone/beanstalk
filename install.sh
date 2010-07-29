#!/bin/bash

. ./install.conf
DESTDIR=$1

install -d -m 755 ${DESTDIR}/$WWW_DIR/pay4memall
install -d -m 755 ${DESTDIR}/$CONFD_DIR
install -d -m 755 ${DESTDIR}/var/lib/pay4memall
install -d -m 755 ${DESTDIR}/usr/bin

install -m 644 build/etc/httpd/conf.d/pay4memallmod_wsgi.conf ${DESTDIR}/$CONFD_DIR/pay4memallmod_wsgi.conf

install -m 755 build/usr/bin/pay4memall-setup ${DESTDIR}/usr/bin/pay4memall-setup

cp -r build/usr/local/www/pay4memall ${DESTDIR}/usr/local/www/
cp -r build/var/lib/pay4memall/* ${DESTDIR}/var/lib/pay4memall
