# Use Tomcat 9 with Java 17
FROM tomcat:9.0-jdk17-openjdk-slim

# Clean up default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# IMPORTANT: This must match the name 'app.binary' from your Jenkinsfile
COPY app.binary /usr/local/tomcat/webapps/ROOT.war

# Port inside the container
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
