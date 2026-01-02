# Bước 1: Build bằng Ant
FROM frekele/ant:1.10.3-jdk8 AS build

# Tạo thư mục làm việc
WORKDIR /app

# Copy toàn bộ code vào container
COPY . .

# [QUAN TRỌNG] Chạy build với các tham số định nghĩa lại đường dẫn thư viện
# Chúng ta dùng dấu / thay vì \\ để phù hợp với Linux trên Render
RUN ant -f build.xml clean dist \
    -Dlibs.CopyLibs.classpath=lib/org-netbeans-modules-java-j2seproject-copylibstask.jar \
    -Dlibs.jakartaee-web-api-8.0.classpath=lib/jakarta.jakartaee-web-api-8.0.0.jar \
    -Dlibs.jakartaee-web-api-9.0.classpath=lib/jakarta.jakartaee-web-api-8.0.0.jar \
    -Dj2ee.platform.classpath=lib/jakarta.jakartaee-web-api-8.0.0.jar

# Bước 2: Chạy bằng Tomcat 9
FROM tomcat:9-jdk8-openjdk-slim

# Xóa các app mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file .war vừa build xong vào Tomcat
# Sử dụng tên file cụ thể từ project.properties của bạn: SWP391-SalesWebsiteProject.war
COPY --from=build /app/dist/SWP391-SalesWebsiteProject.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
