CREATE USER docker WITH SUPERUSER PASSWORD 'docker';
CREATE DATABASE docker WITH OWNER=docker;
\connect docker docker
\i /oauth2-server.sql
\i /testclient.sql
\q
