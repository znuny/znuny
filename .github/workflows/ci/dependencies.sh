#!/usr/bin/env bash

set -o errexit
set -o pipefail

apt-get update
apt-get upgrade -y
apt-get install -y libapache2-mod-perl2 \
  libtimedate-perl libnet-dns-perl libnet-ldap-perl \
  libio-socket-ssl-perl libpdf-api2-perl libdbd-mysql-perl \
  libsoap-lite-perl libtext-csv-xs-perl libjson-xs-perl \
  libapache-dbi-perl libxml-libxml-perl libxml-libxslt-perl \
  libspreadsheet-xlsx-perl libyaml-perl libarchive-zip-perl  \
  libcrypt-eksblowfish-perl libencode-hanextra-perl  \
  libmail-imapclient-perl libtemplate-perl libdatetime-perl \
  libmoo-perl liblocale-po-perl libhash-merge-perl \
  libxml2-utils libical-parser-perl libexpat1-dev \
  apache2 gnupg2 mariadb-client cpanminus make gcc git npm gettext gnupg
