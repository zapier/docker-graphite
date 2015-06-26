FROM ubuntu:14.04

RUN apt-get update && apt-get -y install python-ldap python-cairo python-django python-twisted python-django-tagging python-simplejson python-memcache python-pysqlite2 python-support python-pip gunicorn supervisor

RUN pip install whisper
RUN pip install --install-option="--prefix=/var/lib/graphite" --install-option="--install-lib=/var/lib/graphite/lib" carbon
RUN pip install --install-option="--prefix=/var/lib/graphite" --install-option="--install-lib=/var/lib/graphite/webapp" graphite-web

ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD ./carbon.conf /var/lib/graphite/conf/carbon.conf

VOLUME /var/lib/graphite/storage
RUN cd /var/lib/graphite/webapp/graphite && python manage.py syncdb --noinput

ADD local_settings.py.template /local_settings.py.template
ADD storage-schemas.conf.template /storage-schemas.conf.template

ADD bootstrap.sh /bootstrap.sh

EXPOSE :2003
EXPOSE :2004
EXPOSE :7002
EXPOSE :8000

CMD ["/bootstrap.sh"]
