# Bước 1: Build bằng Ant
FROM frekele/ant:1.10.3-jdk8 AS build

WORKDIR /app
COPY . .

# Ép Ant sử dụng mọi file .jar trong thư mục lib làm classpath
RUN ant -f build.xml clean dist \
    -Dlibs.CopyLibs.classpath=lib/org-netbeans-modules-java-j2seproject-copylibstask.jar \
    -Djavac.classpath="lib/*" \
    -Dj2ee.platform.classpath="lib/*" \
    -Dbuild.sysclasspath=last

# Bước 2: Chạy bằng Tomcat 10 (Dành cho Jakarta EE)
FROM tomcat:10-jdk11-openjdk-slim

RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file .war vào Tomcat
COPY --from=build /app/dist/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
