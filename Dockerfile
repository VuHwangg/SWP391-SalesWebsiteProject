# ========================
# Giai đoạn 1: Build file WAR bằng Java 11
# ========================
# Sử dụng image Ant chạy trên nền Java 11 (Amazon Corretto 11 hoặc OpenJDK 11)
FROM frekele/ant:1.10.13-jdk11 AS build

WORKDIR /app
COPY . .

# 1. Tạo thư mục lib
RUN mkdir -p web/WEB-INF/lib

# 2. Copy thư viện có sẵn từ project
RUN cp lib/*.jar web/WEB-INF/lib/ || true

# 3. Tải thư viện Tomcat 9 (Vẫn dùng Tomcat 9 để tương thích javax.* trong code bạn)
# Java 11 dư sức compile được thư viện của Tomcat 9
RUN mkdir -p /tmp/tomcat-libs && \
    curl -L https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz \
    | tar -xz -C /tmp/tomcat-libs --strip-components=1 && \
    cp /tmp/tomcat-libs/lib/*.jar lib/

# 4. Build
# Vì dùng Java 11 nên javac sẽ không báo lỗi version 55.0/52.0 nữa
RUN export CLASSPATH_STR=$(find lib -name "*.jar" | tr '\n' ':') && \
    ant -f build.xml clean dist \
    -Dlibs.CopyLibs.classpath=lib/org-netbeans-modules-java-j2seproject-copylibstask.jar \
    -Djavac.classpath="$CLASSPATH_STR" \
    -Dj2ee.platform.classpath="$CLASSPATH_STR" \
    -Dbuild.sysclasspath=last

# ========================
# Giai đoạn 2: Chạy Web App trên Tomcat 9 (Java 11)
# ========================
# Lưu ý: Runtime cũng phải là Tomcat 9 chạy trên Java 11
FROM tomcat:9.0-jdk11-openjdk-slim

# Xóa ứng dụng mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file .war thành phẩm sang
COPY --from=build /app/dist/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
