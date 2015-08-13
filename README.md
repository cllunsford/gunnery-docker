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
