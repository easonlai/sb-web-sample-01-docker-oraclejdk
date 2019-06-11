FROM easonlai/oracleserverjre8-oraclelinux7slim
VOLUME /tmp
ADD target/gs-spring-boot-docker-0.1.0.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]