FROM --platform=linux/arm64/v8 gradle:8.1.0-jdk17-focal AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon -x test

FROM --platform=linux/arm64/v8 gradle:8.1.0-jdk17-focal
COPY --from=0 /home/gradle/src/build/libs/*.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]


