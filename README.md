# PostgreSQL-prep

Prepares the PostgreSQL database container with the docker user and database for use by OpenID-Connect image.

This repository is a Docker image build directory maintained
by R.K. Owen, Ph.D. <rk@owen.sj.ca.us>

It's assumed you have some passing knowledge of Docker containers and how
to use them.  If not then browse http://docs.docker.com/ and try them
out for yourself.

Also it's assumed some knowledge of the PostgreSQL relational database and
its tools.

The PostgreSQL-* images rely on the "official" PostgreSQL Docker image,
which should be downloaded to your local set of images with:

```
	docker pull postgres:9.3.4
```

Run this image with something like this:

```
	docker run --name pgsql-server --detach=true postgres:9.3.4
```

To directly access the PostreSQL database from the commandline tool then
do the following:

```
	docker run -it --link pgsql-server:postgres			\
		--rm --name pgsql-client				\
		postgres:9.3.4						\
		sh -c 'exec psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres'
```

With this you can query the database, create new users (roles) or databases,
or spawn an interactive shell to poke around the OS.

## PostgreSQL-prep

This image prepares the PostgreSQL database image with the docker user and
database, along with creating some tables with a test entry for use by 
the OpenID-Connect image.

**This only needs to be run once!**

```
docker run -t --link pgsql-server:postgres                              \
        --rm --name pgsql-prep                                          \
        postgres-prep:9.3.4
```
