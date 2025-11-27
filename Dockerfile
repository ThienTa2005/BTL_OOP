FROM tomcat:9.0-jdk17-temurin

# Copy toàn bộ source web vào Tomcat webapps
COPY ./ /usr/local/tomcat/webapps/ROOT/

# Mở port container
EXPOSE 8080

CMD ["catalina.sh", "run"]
