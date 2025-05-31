# 기존 Tomcat 이미지 대신 JDK 기반으로 변경
FROM openjdk:17-jdk-slim

# WAR 파일 복사
COPY build/libs/dev2-0.0.1-SNAPSHOT.war app.war

# Spring Boot 실행
ENTRYPOINT ["java", "-jar", "/app.war"]