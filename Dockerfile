# ========================
# Giai đoạn 1: Build file WAR
# ========================
# 1. Dùng image Java 11 chính chủ (Eclipse Temurin - thay thế tốt nhất cho OpenJDK)
FROM eclipse-temurin:11-jdk AS build

# 2. Cài đặt Ant thủ công (Đảm bảo 100% thành công)
RUN apt-get update && \
    apt-get install -y ant && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# 3. Chuẩn bị thư viện (Giống logic cũ)
RUN mkdir -p web/WEB-INF/lib

# 4. Copy thư viện có sẵn
RUN cp lib/*.jar web/WEB-INF/lib/ || true

# 5. Tải thư viện Tomcat 9 (Để compile code dính javax.* và Tomcat internals)
RUN mkdir -p /tmp/tomcat-libs && \
    curl -L https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz \
    | tar -xz -C /tmp/tomcat-libs --strip-components=1 && \
    cp /tmp/tomcat-libs/lib/*.jar lib/

# 6. Build với Ant
# Lưu ý: eclipse-temurin đã cài sẵn Java 11, Ant cũng chạy trên Java 11
# nên sẽ khắc phục được lỗi version 55.0/52.0
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

# Xóa ứng dụng mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file .war thành phẩm sang
COPY --from=build /app/dist/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
