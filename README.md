# Django-scaffold

Small scaffold for a django project with a PostgreSQL DB, using docker-compose.

To rename the project, the script `rename_project.sh` can be used.

```
./bin/rename_project.sh my_awesome_project
```

To start service simply run:
```
make
```

To run tests: 
```
docker-compose run web python manage.py test
```
