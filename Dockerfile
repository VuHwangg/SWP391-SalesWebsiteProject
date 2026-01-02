# Bước 1: Dùng Ant để build file .war
FROM frekele/ant:1.10.3-jdk8 AS build

# Đặt thư mục làm việc để quản lý đường dẫn dễ hơn
WORKDIR /app

COPY . .

# [FIX LỖI] Tải thư viện copylibstask.jar mà NetBeans yêu cầu
# Vì server Render không có sẵn thư viện này như máy local của bạn
RUN mkdir -p /usr/share/java \
    && curl -L -o /usr/share/java/copylibs.jar https://repo1.maven.org/maven2/org/netbeans/modules/org-netbeans-modules-java-j2seproject-copylibstask/RELEASE111/org-netbeans-modules-java-j2seproject-copylibstask-RELEASE111.jar

# [FIX LỖI] Thêm tham số -Dlibs.CopyLibs.classpath để Ant nhận diện file vừa tải
RUN ant -Dlibs.CopyLibs.classpath=/usr/share/java/copylibs.jar -f build.xml clean dist

# Bước 2: Chạy bằng Tomcat 9
FROM tomcat:9-jdk8-openjdk-slim
RUN rm -rf /usr/local/tomcat/webapps/*

# Lưu ý: Vì ở trên đã set WORKDIR /app, nên file war sẽ nằm trong /app/dist
COPY --from=build /app/dist/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
