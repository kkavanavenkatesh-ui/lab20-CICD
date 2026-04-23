FROM tomcat:9.0-jdk17-openjdk-slim

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# COPY app.war (which we created in the Jenkins step) to Tomcat's webapps
COPY app.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
