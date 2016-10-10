
docker kill postgres-auth-app && docker rm postgres-auth-app
docker kill postgres-order-app && docker rm postgres-order-app

cd cuba-example-sso-auth-app
./gradlew dropTomcat
cd ../cuba-example-sso-order-app
./gradlew dropTomcat

