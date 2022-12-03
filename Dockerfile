FROM openjdk:18.0.2.1-jdk-oraclelinux8
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} dev0thApp.jar
ENTRYPOINT ["java","-jar","/dev0thApp.jar"]