# Bước 1: Dùng Ant để build file .war
FROM frekele/ant:1.10.3-jdk8 AS build
COPY . .
RUN ant -f build.xml clean dist

# Bước 2: Chạy bằng Tomcat 9 (Vì Java cũ thường chạy tốt trên bản này)
FROM tomcat:9-jdk8-openjdk-slim
RUN rm -rf /usr/local/tomcat/webapps/*

# Lưu ý: Kiểm tra thư mục 'dist' sau khi build local xem file .war tên là gì
# Thay 'CellphoneShop.war' bằng tên thực tế của bạn
COPY --from=build /dist/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
