FROM tomcat:9.0-jdk17-temurin

# Xóa ROOT mặc định của Tomcat (chứa sample)
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy toàn bộ dự án của bạn vào thư mục ROOT mới
COPY ./ /usr/local/tomcat/webapps/ROOT/

# Expose cổng Tomcat
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]
