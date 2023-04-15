FROM gradle:8.1.0-jdk17-focal
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]