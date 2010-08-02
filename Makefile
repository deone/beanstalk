VERSION=0.1
NAME=pay4memall
TOPDIR=/home/zedd/rpmbuild

all: build
	@echo "All Done"

build:
	@mkdir -p build/etc/httpd/conf.d
	@mkdir -p build/usr/local/www/pay4memall
	@mkdir -p build/var/lib/pay4memall/sql
	@mkdir -p build/usr/bin
	@cp conf/pay4memallmod_wsgi.conf build/etc/httpd/conf.d/
	@cp bin/pay4memall-setup build/usr/bin/
	@cp -r apache/ site_media/ templates/ account/ mall/ store/ build/usr/local/www/pay4memall/
	@cp helpers.* __init__.* manage.py settings* urls.* abstract_model.* build/usr/local/www/pay4memall/
	@cp -r sql/* build/var/lib/pay4memall/sql/

install: build
	@./install.sh $(DESTDIR)

clean:
	@rm -rf build

dist: distclean
	@mkdir -p $(NAME)-$(VERSION)
	@cp -r bin $(NAME)-$(VERSION)/
	@cp -r conf $(NAME)-$(VERSION)/
	@cp -r apache $(NAME)-$(VERSION)/
	@cp -r account/ mall/ store/ templates/ site_media/ sql/ $(NAME)-$(VERSION)/
	@cp helpers.* __init__.* manage.py settings* urls.* abstract_model.* $(NAME)-$(VERSION)/
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