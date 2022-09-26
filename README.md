A morse code chat app built on pure Node.js (no backend frameworks) and React (MUI, Redux)

If you will be testing the functionality of the code on your machine:

* Add appropriate values in backend/config.ts,

* Comment out https server initialization in backend/index.ts, otherwise you'll need to generate your own SSL certificates,

* Change the "serverURL" in frontend/src/webSocketsUtil/ to "https://localhost:<port_specified_in_backend_config.ts>

* Use the restore_backup.sql to initialize the postgre db: 
-- $ create database <some_new_db_name> with owner admin;  <--- if you want to specify a different user, you'll have to change permissions for the restored db, since that one has "admin" as its owner
-- $ psql <some_new_db_name> < restore_backup.sql

Login:
![login page](https://github.com/svitan0k/infotech-test-prj/blob/master/preview/2022-09-26_20-59.png?raw=true)

Register:
![register page](https://github.com/svitan0k/infotech-test-prj/blob/master/preview/2022-09-26_21-00.png)

Homepage:
![home page](https://github.com/svitan0k/infotech-test-prj/blob/master/preview/2022-09-26_21-01.png)

Chat:
![chat page](https://github.com/svitan0k/infotech-test-prj/blob/master/preview/2022-09-26_21-02.png)
