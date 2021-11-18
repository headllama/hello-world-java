FROM openjdk:11-jdk-alpine
COPY target/spring-boot-hello-1.0.jar
ENTRYPOINT ["java","-jar","/spring-boot-hello-1.0.jar"]
