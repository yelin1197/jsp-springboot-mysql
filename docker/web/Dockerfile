FROM openjdk:11-jdk-slim

WORKDIR /app

COPY app.war app.war

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.war"] 