FROM tomcat:9.0-jdk17-temurin

# Xóa ROOT mặc định
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy toàn bộ project vào ROOT
COPY ./ /usr/local/tomcat/webapps/ROOT/

# Tomcat chạy
EXPOSE 8080
CMD ["catalina.sh", "run"]
