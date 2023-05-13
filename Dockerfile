FROM gradle:latest
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon -x test

FROM gradle:latest
COPY --from=0 /home/gradle/src/build/libs/*.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]


