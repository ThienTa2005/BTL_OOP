# Stage 1: Build bằng Ant trên nền Tomcat
FROM tomcat:9.0-jdk17-temurin AS builder

# Cài ant để build NetBeans project
RUN apt-get update && apt-get install -y ant && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy toàn bộ project vào container build
COPY . .

# Build NetBeans project: tạo dist/*.war
# Truyền j2ee.server.home cho Ant (Tomcat ở /usr/local/tomcat)
RUN ant -Dj2ee.server.home=/usr/local/tomcat clean dist

# Stage 2: Chạy trên Tomcat thật
FROM tomcat:9.0-jdk17-temurin

# Deploy WAR vừa build thành ROOT.war để chạy ở "/"
COPY --from=builder /app/dist/*.war /usr/local/tomcat/webapps/ROOT.war

# Mở port cho Railway
EXPOSE 8080

CMD ["catalina.sh", "run"]
