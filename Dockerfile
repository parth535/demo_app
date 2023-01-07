FROM maven as parent
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk:11.0
WORKDIR /app
COPY --from=parent /app/target/my-application.jar /app/
EXPOSE 8082
CMD ["java","-jar","my-application.jar"]