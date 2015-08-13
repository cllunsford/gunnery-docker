# gunnery-docker

My attempt at dockerizing the gunnery app.  Includes gunnery django app, uwsgi, nginx, rabbitmq, and celery services managed by supervisord.  Postgres db not included.

docker-compose setup has a companion postgres container for local testing.

Current Status: image builds and runs but hangs on `+ Servers`.  Suspect I'm hitting gunnery/gunnery#17 but haven't been able to resolve.

# Usage

```
Edit docker-compose.yml:
ADMIN_EMAIL: "admin@admin.local"

# First time, need to let postgres initialize
docker-compose build
docker-compose up db
# Once db init is complete, break and...
docker-compose up
```
Login with ADMIN_EMAIL / admin in http interface.
Change admin default password.

# Outstanding tasks

 * manage.py migrate fails after first time (not idempotent)
 * manage.py createsuperuser fails after first time (not idempotent)
 * clicking + on servers / tasks hangs
 * allowed_hosts generic setup
