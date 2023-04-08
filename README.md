
![Image link](https://github.com/ris04hit/cop290_assignment2/blob/main/backend/environments/static/data/Logo%20(1).png)

# **Synergy is a collaborative open source platform for resource and file sharing**

The structure of the repository and a brief description about various branches is as follows:

Note: The user have to first create a database named Synergy_db on MySQL and have to ensure that root.localhost works on the user's local device and then have to update the variables (app.secret_key, app.config["MYSQL_PASSWORD"]) in [app.py]

The structure of the repository and a brief description about various branches is as follows:
- [API Design](https://github.com/ris04hit/cop290_assignment2/tree/main/API%20design)
    - [ERD_Final.pdf](https://github.com/ris04hit/cop290_assignment2/blob/main/API%20design/ERD.png) contains ER Diagram of Database
    - [design.txt](https://github.com/ris04hit/cop290_assignment2/blob/main/API%20design/design.txt) contains the classes and methods decided for restAPI's.
    - [restAPI.yaml](https://github.com/ris04hit/cop290_assignment2/blob/main/API%20design/restAPI.yaml) contains code for the yaml file for swagger generated documentation of API's.
- [Backend](https://github.com/ris04hit/cop290_assignment2/tree/main/backend)
    - [data](https://github.com/ris04hit/cop290_assignment2/tree/main/backend/data) folder contains some online data which we will use in feeding database.
    - [environments](https://github.com/ris04hit/cop290_assignment2/tree/main/backend/environments)
        - [static](https://github.com/ris04hit/cop290_assignment2/tree/main/backend/environments/static) folder
            - [css](https://github.com/ris04hit/cop290_assignment2/tree/main/backend/environments/static/css) folder contains css files used in frontend.
            - [data](https://github.cohttps://github.com/ris04hit/cop290_assignment2/tree/main/backend/environments/static/datam/ris04hit/WebDev_COP/tree/main/backend/environments/static/data) folder contains jpeg, mkv, png files used in frontend.
        - [templates](https://github.com/ris04hit/cop290_assignment2/tree/main/backend/environments/templates)
            - [html](https://github.com/ris04hit/cop290_assignment2/tree/main/backend/environments/templates/html) folder contains html files used in frontend.
            - [js](https://github.com/ris04hit/cop290_assignment2/tree/main/backend/environments/templates/js) folder contains javascript files used in frontend.
        - [schema.sql](https://github.com/ris04hit/cop290_assignment2/blob/main/backend/environments/schema.sql), [DatabaseExtend.sql](https://github.com/ris04hit/cop290_assignment2/blob/main/backend/environments/DatabaseExtend.sql), [FeedExtradata.sql](https://github.com/ris04hit/cop290_assignment2/blob/main/backend/environments/FeedExtraData.sql) contans mysql commands to create tables and feed test data into database
        - [app.py](https://github.com/ris04hit/cop290_assignment2/blob/main/backend/environments/app.py) and [helper.py](https://github.com/ris04hit/WebDev_COP/blob/main/backend/environments/helper.py) contains python flask code for our backend API's and other helper functions.
