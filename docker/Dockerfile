FROM centos:7
LABEL daisy_image_version=1.1
ARG BRANCH
ENV BRANCH=${BRANCH:-master}
RUN yum -y update
RUN yum -y install centos-release-openstack-ocata
RUN yum -y install \
  genisoimage \
  wget \
  coreutils \
  which \
  gawk \
  grep \
  git \
  intltool \
  make \
  rpm \
  rpm-build \
  gcc \
  autoconf \
  automake \
  fontawesome-fonts-web \
  glibc-devel \
  python-sphinx \
  python-XStatic-Angular \
  python-XStatic-Angular-Bootstrap \
  python-XStatic-Angular-lrdragndrop \
  python-XStatic-Angular-Mock \
  python-XStatic-Bootstrap-Datepicker \
  python-XStatic-Bootstrap-SCSS \
  python-XStatic-D3 \
  python-XStatic-Font-Awesome \
  python-XStatic-Hogan \
  python-XStatic-Jasmine \
  python-XStatic-jQuery \
  python-XStatic-JQuery-Migrate \
  python-XStatic-JQuery-quicksearch \
  python-XStatic-JQuery-TableSorter \
  python-XStatic-jquery-ui \
  python-XStatic-JSEncrypt \
  python-XStatic-Magic-Search \
  python-XStatic-QUnit \
  python-XStatic-Rickshaw \
  python-XStatic-smart-table \
  python-XStatic-Spin \
  python-XStatic-termjs \
  python2-oslo-sphinx \
  python2-oslo-messaging \
  python2-oslo-concurrency \
  python2-oslo-sphinx \
  python-devel \
  python-d2to1 \
  python-django-compressor \
  python-django-openstack-auth \
  python-django-pyscss \
  python-lesscpy \
  python-migrate \
  python-pint \
  python-routes
