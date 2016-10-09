#!/bin/bash

echo 'starting postgres intances (port: 5433, 5434)'
docker run -d -p "5433:5432" --name postgres-auth-app -e POSTGRES_PASSWORD=postgres postgres
docker run -d -p "5434:5432" --name postgres-order-app -e POSTGRES_PASSWORD=postgres postgres

echo 'starting auth-app (http://localhost:8081/app)'
cuba-example-sso-auth-app/gradlew updateDb
cuba-example-sso-auth-app/gradlew deploy
cuba-example-sso-auth-app/build/tomcat/bin/startup.sh


echo 'starting order-app (http://localhost:8082/app)'
cuba-example-sso-order-app/gradlew updateDb
cuba-example-sso-order-app/gradlew deploy
cuba-example-sso-order-app/build/tomcat/bin/startup.sh
