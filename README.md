# Hair Salon

Hair Salon

Create an application for a hair salon. The stylists at the salon work independently, so each client will only belong to a single stylist (one stylist, many clients).

The following user stories should be completed:

* As a salon owner, I want to view, add, update and delete stylists.
* As a salon owner, I want to view, add, update and delete clients.
* As a salon owner, I want to add clients to a stylist.

## Note:

* This website is mobile responsive using Bootstrap
* This website is deployed on Heroku:
https://hair-salon-df.herokuapp.com/


## Additional Requirements

Production Database: hair_salon
Development Database: hair_salon_test
Resource names: clients and stylists


## Database setup instructions:
In PSQL:

CREATE DATABASE hair_salon;
\c hair_salon;

CREATE TABLE "clients" (
"id"  SERIAL ,
"name" VARCHAR ,
"stylist_id" INTEGER ,
PRIMARY KEY ("id")
);

CREATE TABLE "stylists" (
"id"  SERIAL ,
"name" VARCHAR ,
PRIMARY KEY ("id")
);

ALTER TABLE "clients" ADD FOREIGN KEY ("stylist_id") REFERENCES "stylists" ("id");

CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
