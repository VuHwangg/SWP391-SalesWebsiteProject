# ========================
# Giai đoạn 1: Build file WAR
# ========================
# Dùng image Java 11 chính chủ (Luôn tồn tại và ổn định)
FROM eclipse-temurin:11-jdk AS build

# Cài đặt Ant thủ công
RUN apt-get update && \
    apt-get install -y ant && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Chuẩn bị thư mục lib
RUN mkdir -p web/WEB-INF/lib
RUN cp lib/*.jar web/WEB-INF/lib/ || true

# Tải thư viện Tomcat 9 (Bắt buộc để compile code Servlet/JSP)
RUN mkdir -p /tmp/tomcat-libs && \
    curl -L https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz \
    | tar -xz -C /tmp/tomcat-libs --strip-components=1 && \
    cp /tmp/tomcat-libs/lib/*.jar lib/

# Build với Ant (Java 11)
# Không cần tải commons-io nữa
RUN export CLASSPATH_STR=$(find lib -name "*.jar" | tr '\n' ':') && \
    ant -f build.xml clean dist \
    -Dlibs.CopyLibs.classpath=lib/org-netbeans-modules-java-j2seproject-copylibstask.jar \
    -Djavac.classpath="$CLASSPATH_STR" \
    -Dj2ee.platform.classpath="$CLASSPATH_STR" \
    -Dbuild.sysclasspath=last

# ========================
# Giai đoạn 2: Chạy Web App
# ========================
FROM tomcat:9.0-jdk11-openjdk-slim

RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/dist/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
