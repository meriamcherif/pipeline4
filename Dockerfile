FROM maven:3.8.4 AS build 
WORKDIR /app
COPY . . 
RUN mvn package
RUN mvn test

FROM openjdk:11
WORKDIR /app 
COPY --from=build /app/target/app.jar .  
EXPOSE 8083
ENTRYPOINT ["java", "-jar", "app.jar"] 