# Bước 1: Build bằng Ant
FROM frekele/ant:1.10.3-jdk8 AS build

# Tạo thư mục làm việc
WORKDIR /app

# Copy toàn bộ code vào container
COPY . .

# Chạy build. Chúng ta trỏ trực tiếp vào file trong thư mục lib của bạn
# Lưu ý: Đảm bảo file này đã được bạn push lên thư mục lib/ trên GitHub
RUN ant -Dlibs.CopyLibs.classpath=lib/org-netbeans-modules-java-j2seproject-copylibstask.jar -f build.xml clean dist

# Bước 2: Chạy bằng Tomcat 9
FROM tomcat:9-jdk8-openjdk-slim

# Xóa các app mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file .war vừa build xong vào Tomcat và đổi tên thành ROOT.war
COPY --from=build /app/dist/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
