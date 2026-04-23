FROM tomcat:9.0-jdk17-openjdk-slim

# Clean Tomcat's default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# MATCH THIS to what Jenkins created:
COPY app.binary /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
