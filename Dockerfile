FROM tomcat:9.0-jdk17-temurin

# Xóa ROOT mặc định
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy đúng thư mục web (đây là webapp thực sự của bạn)
COPY ./web /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080
CMD ["catalina.sh", "run"]
