FROM tomcat:9.0-jdk17-temurin

# Copy file WAR đã build sẵn vào Tomcat, chạy dưới context ROOT ("/")
COPY dist/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
