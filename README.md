## BigBank
###### Home Assignment for Data Steward

Repository includes files:
  - files to set up table and populate it
  - SQL query solution compatible with PostgreSQL ([PostgreSQL_Football_Standings.sql](PostgreSQL_Football_Standings.sql))
  - Tableau workbooks with user interface (open with Tableau Reader: [Reader_Football_Standings.twbx](Reader_Football_Standings.twbx), open with Tableau Desktop: [Desktop_Football_Standings.twbx](Desktop_Football_Standings.twbx))
  
No additional set up is required to view solution stored in [Reader_Football_Standings.twbx](Reader_Football_Standings.twbx) file, since it incorporates extracted data.

To review the SQL solution from the [PostgreSQL_Football_Standings.sql](PostgreSQL_Football_Standings.sql) and Tableau solution from [Desktop_Football_Standings.twbx](Desktop_Football_Standings.twbx) (cannot be opened without referenced db, since has parametrized source for better performance), please proceed with the following steps:

- run Docker container using the following command:

`docker run --rm --name postgres -e POSTGRES_USER="root" -e POSTGRES_PASSWORD="toor" -e POSTGRES_DB="tableau" -p 5432:5432 postgres:9.6.17-alpine`

- log in to the created database with the credentials:
    * host: 127.0.0.1
    * port: 5432
    * database: tableau
    * user: root
    * password: toor

- run the script named [Tables_SetUp.sql](Tables_SetUp.sql) to create appropriate schema and table, and populate it with data.


