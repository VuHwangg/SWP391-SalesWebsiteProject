# ========================
# Giai đoạn 1: Build file WAR (Nâng cấp lên JDK 11)
# ========================
FROM openjdk:11-jdk-slim AS build

# Cài đặt Ant và Curl (vì image Java 11 gốc chưa có sẵn)
RUN apt-get update && apt-get install -y ant curl && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# 1. Chuẩn bị thư viện cho file WAR
RUN mkdir -p web/WEB-INF/lib && cp lib/*.jar web/WEB-INF/lib/ || true

# 2. Tải Tomcat 10 để lấy bộ thư viện chuẩn (jakarta.*)
# Dùng Java 11 ở bước này sẽ đọc được các file jar này mà không bị lỗi version 55.0
RUN mkdir -p /tmp/tomcat-libs && \
    curl -L https://archive.apache.org/dist/tomcat/tomcat-10/v10.1.18/bin/apache-tomcat-10.1.18.tar.gz \
    | tar -xz -C /tmp/tomcat-libs --strip-components=1 && \
    cp /tmp/tomcat-libs/lib/*.jar lib/

# 3. Chạy Ant để biên dịch
RUN export CLASSPATH_STR=$(find lib -name "*.jar" | tr '\n' ':') && \
    ant -f build.xml clean dist \
    -Dlibs.CopyLibs.classpath=lib/org-netbeans-modules-java-j2seproject-copylibstask.jar \
    -Djavac.classpath="$CLASSPATH_STR" \
    -Dj2ee.platform.classpath="$CLASSPATH_STR" \
    -Dbuild.sysclasspath=last

# ========================
# Giai đoạn 2: Chạy Web App trên Tomcat 10
# ========================
FROM tomcat:10.1-jdk11-openjdk-slim

RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file .war đã build xong vào thư mục chạy của Tomcat
COPY --from=build /app/dist/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
