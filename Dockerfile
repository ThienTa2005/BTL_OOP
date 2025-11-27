FROM tomcat:9.0-jdk17-temurin

# Copy file WAR NetBeans build sang Tomcat, đổi tên thành ROOT.war
# để ứng dụng chạy ở context "/" (giống localhost của bạn)
COPY ./dist/du_an1.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
