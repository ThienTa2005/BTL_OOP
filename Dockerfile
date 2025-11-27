# Stage 1: Build bằng Ant
FROM eclipse-temurin:17-jdk AS builder

# Cài ant
RUN apt-get update && apt-get install -y ant && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy toàn bộ project vào container build
COPY . .

# Build NetBeans project: tạo file dist/BTL_OOP.war
RUN ant clean dist

# Stage 2: Chạy trên Tomcat
FROM tomcat:9.0-jdk17-temurin

# Copy WAR đã build thành ROOT.war để chạy ở context "/"
COPY --from=builder /app/dist/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
