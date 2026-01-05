# Sử dụng JDK 17 để build
FROM eclipse-temurin:17-jdk AS build
WORKDIR /app

# 1. Copy code
COPY . .

# 2. Tạo thư mục lib
RUN mkdir -p web/WEB-INF/lib

# Copy file jar cá nhân (nếu có)
RUN cp lib/*.jar web/WEB-INF/lib/ || true

# === TẢI THƯ VIỆN (PHẦN QUAN TRỌNG NHẤT) ===

# 1. Jakarta EE API (Giữ nguyên)
RUN curl -L https://repo1.maven.org/maven2/jakarta/platform/jakarta.jakartaee-api/9.1.0/jakarta.jakartaee-api-9.1.0.jar -o web/WEB-INF/lib/jakarta-api.jar

# 2. JSTL (Giữ nguyên)
RUN curl -L https://repo1.maven.org/maven2/org/glassfish/web/jakarta.servlet.jsp.jstl/3.0.1/jakarta.servlet.jsp.jstl-3.0.1.jar -o web/WEB-INF/lib/jstl-impl.jar && \
    curl -L https://repo1.maven.org/maven2/jakarta/servlet/jsp/jstl/jakarta.servlet.jsp.jstl-api/3.0.0/jakarta.servlet.jsp.jstl-api-3.0.0.jar -o web/WEB-INF/lib/jstl-api.jar

# 3. Tomcat Embed Core 10.0.27 (Giữ nguyên để tránh lỗi ServletFileUpload)
RUN curl -L https://repo1.maven.org/maven2/org/apache/tomcat/embed/tomcat-embed-core/10.0.27/tomcat-embed-core-10.0.27.jar -o web/WEB-INF/lib/tomcat-embed-core.jar

# 4. [MỚI] Tải PostgreSQL Driver (Thay cho MSSQL)
# Đây là "chìa khóa" để Java nói chuyện được với Supabase
RUN curl -L https://repo1.maven.org/maven2/org/postgresql/postgresql/42.7.2/postgresql-42.7.2.jar -o web/WEB-INF/lib/postgresql.jar

# === BIÊN DỊCH ===
RUN mkdir -p web/WEB-INF/classes

# Gom lib và biên dịch
RUN LIBS=$(find web/WEB-INF/lib -name "*.jar" | tr '\n' ':') && \
    export CLASSPATH="$LIBS" && \
    find src -name "*.java" > sources.txt && \
    javac -d web/WEB-INF/classes -cp "$CLASSPATH" @sources.txt

# Copy resources (xml, properties...)
RUN find src -type f -not -name "*.java" -exec cp --parents {} web/WEB-INF/classes \; || true

# Đóng gói WAR
RUN jar -cvf ROOT.war -C web .

# === CHẠY ===
FROM tomcat:10.0-jdk17
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
