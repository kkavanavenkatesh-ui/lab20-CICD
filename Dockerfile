FROM tomcat:9-jre17-alpine
# This copies your built WAR file into the Tomcat webapps folder
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
