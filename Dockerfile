# ========================
# Giai đoạn 1: Build file WAR
# ========================
FROM eclipse-temurin:11-jdk AS build

# Cài đặt Ant
RUN apt-get update && \
    apt-get install -y ant && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# 1. Chuẩn bị thư mục lib
RUN mkdir -p web/WEB-INF/lib

# 2. Copy thư viện từ máy bạn sang (Nhưng sẽ xóa các file gây xung đột ngay sau đó)
RUN cp lib/*.jar web/WEB-INF/lib/ || true

# 3. [QUAN TRỌNG] Xóa các thư viện Jakarta/Servlet API gây xung đột nếu lỡ copy vào
RUN rm -f web/WEB-INF/lib/jakarta.*.jar \
    web/WEB-INF/lib/servlet-api.jar \
    web/WEB-INF/lib/jsp-api.jar \
    web/WEB-INF/lib/jstl-*.jar \
    web/WEB-INF/lib/taglibs-*.jar

# 4. [FIX LỖI 500] Tải JSTL 1.2 chuẩn cho Tomcat 9 (javax)
RUN curl -L https://repo1.maven.org/maven2/javax/servlet/jstl/1.2/jstl-1.2.jar -o web/WEB-INF/lib/jstl-1.2.jar

# 5. Tải thư viện Tomcat 9 để compile
RUN mkdir -p /tmp/tomcat-libs && \
    curl -L https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz \
    | tar -xz -C /tmp/tomcat-libs --strip-components=1 && \
    cp /tmp/tomcat-libs/lib/*.jar lib/

# 6. Build với Ant
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

# Copy file WAR
COPY --from=build /app/dist/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
