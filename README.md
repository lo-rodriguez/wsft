#########WSFT
## Steps to Setup

**1. Clone the application**

```bash
 https://github.com/lo-rodriguez/wsft.git
```

**2. Create Mysql or MariaDB database**
```bash
create database wsft
```

**3. Change mysql username and password as per your installation**

+ open `src/main/resources/application.properties`

+ change `spring.datasource.username` and `spring.datasource.password` as per your mysql installation

**4. Build and run the app using maven**

```bash
mvn tomcat-run
running wsft.war

```

Alternatively, you can run the app without packaging it using -

```bash
mvn spring-boot:run
```

The app will start running at <http://localhost:8080>.

## Explore Rest APIs

The app defines following CRUD APIs.

    GET /api/v1/users
    
    POST /api/v1/users
    
    GET /api/v1/users/{userId}
    
    PUT /api/v1/users/{userId}
    
    DELETE /api/v1/users/{userId}

You can find the tutorial for this application on my blog -
contact to:
sysadmin@ronasoft.net
wsfamilytracking0.4 : FIREBASE BACKEND
