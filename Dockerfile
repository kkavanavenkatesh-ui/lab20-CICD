# Step 1: Use Tomcat 9 with Java 17
FROM tomcat:9.0-jdk17-openjdk-slim

# Step 2: Remove default Tomcat apps to avoid conflicts
RUN rm -rf /usr/local/tomcat/webapps/*

# Step 3: Copy the WAR file from the target folder
# We rename it to ROOT.war so the app opens at http://localhost:8087/ (no extra path)
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Step 4: Tell Docker we are using port 8080 inside the container
EXPOSE 8080

# Step 5: Start the server
CMD ["catalina.sh", "run"]
