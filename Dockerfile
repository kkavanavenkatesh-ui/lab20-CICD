# Use OpenJDK instead of Tomcat since you have a .jar file
FROM openjdk:17-jdk-slim

# Create a working directory
WORKDIR /app

# Copy the binary created by Jenkins
COPY app.binary app.jar

# Expose port 8080 (most Spring Boot/Java apps use this by default)
EXPOSE 8080

# Run the jar file directly
ENTRYPOINT ["java", "-jar", "app.jar"]
