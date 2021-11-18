FROM openjdk:18-jdk-alpine3.14
COPY target/spring-boot-hello-1.0.jar spring-boot-hello-1.0.jar
ENTRYPOINT ["java","-jar","/spring-boot-hello-1.0.jar"]
