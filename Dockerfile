FROM debian:wheezy

RUN apt-get update && apt-get -y install --no-install-recommends bash git curl ca-certificates supervisor python-dev python-pip make gcc libpq-dev uwsgi nginx && apt-get clean
RUN echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list
RUN curl https://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add -
RUN apt-get update && apt-get -y install --no-install-recommends rabbitmq-server && apt-get clean

# Gunnery
RUN git clone --branch v0.2-alpha https://github.com/gunnery/gunnery.git /var/gunnery
WORKDIR /var/gunnery
RUN pip install -r requirements/production.txt
RUN useradd gunnery
RUN mkdir -p /var/gunnery/log /var/gunnery/run
RUN chown gunnery:gunnery /var/gunnery/log /var/gunnery/run

# Docs
RUN cd docs; make htmlembedded

# uWSGI
ADD uwsgi.ini /etc/uwsgi/apps-enabled/gunnery.ini

# nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
ADD nginx.django.conf /etc/nginx/sites-enabled/gunnery.conf

# Supervisor setup
RUN mkdir -p /var/log/supervisor /opt/supervisor
ADD gunnery.conf /etc/supervisor/conf.d/gunnery.conf

# Override ALLOWED_HOSTS
ADD production.py /var/gunnery/gunnery/gunnery/settings/production.py

EXPOSE 8080

ADD run.sh /opt/run.sh
CMD ["/opt/run.sh"]
