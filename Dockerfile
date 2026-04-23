# Use Eclipse Temurin - the most reliable Java 17 image
FROM eclipse-temurin:17-jdk-alpine

# Create a working directory
WORKDIR /app

# Copy the app.binary (your JAR file) created by the Jenkins build
COPY app.binary app.jar

# Expose port 8080
EXPOSE 8080

# Run the jar directly
ENTRYPOINT ["java", "-jar", "app.jar"]
