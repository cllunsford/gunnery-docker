#!/bin/bash

initfile=/etc/gunnery.init

if [ ! -f "${initfile}" ]; then
  cd /var/gunnery/gunnery
  python manage.py syncdb
  python manage.py migrate --merge
  python manage.py collectstatic --noinput
  #python manage.py createsuperuser
  echo "from account.models import CustomUser; CustomUser.objects.create_superuser(password='admin', email='${ADMIN_EMAIL}')" | python manage.py shell
  touch "${initfile}"
fi

/usr/bin/supervisord
