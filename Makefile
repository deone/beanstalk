VERSION=0.1
NAME=pay4memall
TOPDIR=/home/$(HOST)/rpmbuild

all: build
	@echo "All Done"

build:
	@mkdir -p build/etc/httpd/conf.d
	@mkdir -p build/usr/local/www/pay4memall
	@mkdir -p build/var/lib/pay4memall/sql
	@mkdir -p build/usr/bin
	@mkdir build/usr/local/www/pay4memall/site_media
	@cp conf/pay4memallmod_wsgi.conf build/etc/httpd/conf.d/
	@cp bin/pay4memall-setup build/usr/bin/
	@cp -r apache/ templates/ account/ mall/ store/ payment/ shopping_cart/ build/usr/local/www/pay4memall/
	@cp -r site_media/css/ site_media/js/ site_media/img/ build/usr/local/www/pay4memall/site_media/
	@cp helpers.* __init__.* manage.py settings* urls.* abstract_model.* search_sites.* build/usr/local/www/pay4memall/
	@cp sql/create.sql build/var/lib/pay4memall/sql/

install: build
	@./install.sh $(DESTDIR)

clean:
	@rm -rf build

dist: distclean
	@mkdir -p $(NAME)-$(VERSION)
	@mkdir $(NAME)-$(VERSION)/site_media
	@mkdir $(NAME)-$(VERSION)/sql
	@cp sql/create.sql $(NAME)-$(VERSION)/sql/
	@cp -r bin $(NAME)-$(VERSION)/
	@cp -r conf $(NAME)-$(VERSION)/
	@cp -r apache $(NAME)-$(VERSION)/
	@cp -r account/ mall/ store/ payment/ shopping_cart/ templates/ $(NAME)-$(VERSION)/
	@cp -r site_media/css/ site_media/js/ site_media/img/ $(NAME)-$(VERSION)/site_media/
	@cp helpers.* __init__.* manage.py settings* urls.* abstract_model.* search_sites.* $(NAME)-$(VERSION)/
	@cp INSTALL MANIFEST.in Makefile README TODO $(NAME)-$(VERSION)/
	@cp install.sh install.conf pay4memall.spec $(NAME)-$(VERSION)/
	@tar -czvf $(NAME)-$(VERSION).tar.gz $(NAME)-$(VERSION)/*
	@rm -rf $(NAME)-$(VERSION)
	@echo "All Done"

distclean: clean
	@rm -rf $(NAME)-$(VERSION)*
	@rm -rf $(NAME)-debuginfo*

rpm: dist
	@rpmbuild -tb $(NAME)-$(VERSION).tar.gz
	@mv $(TOPDIR)/RPMS/i386/$(NAME)*.rpm .
