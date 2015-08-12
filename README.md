# Usage

```
Edit docker-compose.yml:
ADMIN_EMAIL: "admin@admin.local"

docker-compose build && docker-compose up
```
Login with ADMIN_EMAIL / admin in http interface.
Change admin default password.

# Outstanding tasks

 * docs generation (apt-get install make cd docs make htmlembedded)
 * manage.py migrate fails (not idempotent)
 * manage.py createsuperuser is not idempotent
 * clicking + on servers / tasks hangs
 * optimize Dockerfile
