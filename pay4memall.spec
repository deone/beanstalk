Summary:	Web-based shopping mall using pay4me as payment platform.
Name:		pay4memall
Version:	0.1
Release:	9
Group:		Business Solutions/Web-based
License:	GPL
Source0:	%{name}-%{version}.tar.gz
BuildRoot:	%{_tmppath}/%{name}-%{version}-%{release}-build

Prereq:		mysql-server
Prereq:		mysql
Prereq:		httpd
Prereq:		python


%description
Web-based shopping mall using pay4me as payment platform.


%prep
%setup -q


%build
make


%install
rm -rf $RPM_BUILD_ROOT
make install DESTDIR=$RPM_BUILD_ROOT


%clean
rm -rf $RPM_BUILD_ROOT


%files
%defattr(-,root,root,-)
%config /etc/httpd/conf.d/pay4memallmod_wsgi.conf
/usr/local/www/
/usr/bin/pay4memall-setup
/var/lib/pay4memall/


%post
echo "Success! To complete the installation, please run 'pay4memall-setup' on the command line"
