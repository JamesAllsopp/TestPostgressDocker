# Postgres containers with Docker/Podman

Trying to build a system that we can easily run integration tests against.

The idea is that we;

+ Startup a python virtual environment (python -v venv env , source env/bin/activate, pip install <requirements.txt)
+ start up a postgres docker container
+ Use the python scripts to create a database in the docker container and generate some data to put in it.
  - First run `build_database.py` to build the database in the container
  - Then run `import_data.py` to insert some data in the container. This will also create a file called
    `data_to_be_stored.pkl` which will be used for testing.
  
+ Dump the data out
+ Build a new container based on the original postgres image but including the new data.
+ Run pytest tests against this

Feel free to change podman for docker in any of these commands. 

To create the standard postgres container, run:
```
podman run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d -p5432:5432 postgres
```

To connect to database (default p/w mysecretpassword):
```
psql -h localhost -p 5432 -U postgres
```

To dump the database created with the python files from the standard postgres container (very important to keep the file
ending as .sql, or it won't get installed, also -C to include database creation):
```
pg_dump -h localhost -p 5432 -U postgres -C test_database > docker/test.sql
```

To build the final image (must be run from the docker image):
```
podman build -t testdb:v1 .
```

To run final image:
```
podman run --replace --name test_db -e POSTGRES_PASSWORD=mysecretpassword -d -p5432:5432 localhost/testdb:v1 
```
