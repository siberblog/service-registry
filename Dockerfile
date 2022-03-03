# Use an official OpenJDK runtime as a parent image
FROM openjdk:11.0.7-jre-slim-buster

# set shell to bash
# source: https://stackoverflow.com/a/40944512/3128926
#RUN apk update && apk add bash

# Set the working directory to /app
WORKDIR /app

# Copy the fat jar into the container at /app
COPY service-registry-0.0.1-SNAPSHOT.jar /app

# Make port 358080 available to the world outside this container
EXPOSE 8761

#ENV variables
ENV spring.profiles.active=test
ENV SERVER_PORT=8761

# Run jar file when the container launches
CMD ["java", "-jar", "service-registry-0.0.1-SNAPSHOT.jar"]
