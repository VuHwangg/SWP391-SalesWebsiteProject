# ========================
# Giai đoạn 1: Build file WAR
# ========================
FROM frekele/ant:1.10.3-jdk8 AS build

WORKDIR /app
COPY . .

# 1. Tạo thư mục lib trong WEB-INF để đóng gói vào file WAR
RUN mkdir -p web/WEB-INF/lib && cp lib/*.jar web/WEB-INF/lib/ || true

# 2. [FIX] Tải Tomcat 10 (thay vì 9) để có bộ thư viện jakarta.* lúc compile
RUN mkdir -p /tmp/tomcat-libs && \
    curl -L https://archive.apache.org/dist/tomcat/tomcat-10/v10.1.18/bin/apache-tomcat-10.1.18.tar.gz \
    | tar -xz -C /tmp/tomcat-libs --strip-components=1 && \
    cp /tmp/tomcat-libs/lib/*.jar lib/

# 3. Tạo chuỗi Classpath chuẩn Linux
RUN export CLASSPATH_STR=$(find lib -name "*.jar" | tr '\n' ':') && \
    ant -f build.xml clean dist \
    -Dlibs.CopyLibs.classpath=lib/org-netbeans-modules-java-j2seproject-copylibstask.jar \
    -Djavac.classpath="$CLASSPATH_STR" \
    -Dj2ee.platform.classpath="$CLASSPATH_STR" \
    -Dbuild.sysclasspath=last

# ========================
# Giai đoạn 2: Chạy Web App (Phải là Tomcat 10)
# ========================
FROM tomcat:10-jdk11-openjdk-slim

RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file .war thành phẩm vào thư mục webapps của Tomcat 10
COPY --from=build /app/dist/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
