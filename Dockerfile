# ========================
# Giai đoạn 1: Build Thủ Công (Manual Build)
# ========================
FROM eclipse-temurin:11-jdk AS build
WORKDIR /app

# 1. Copy toàn bộ source code
COPY . .

# 2. Chuẩn bị thư mục chứa thư viện (web/WEB-INF/lib)
RUN mkdir -p web/WEB-INF/lib

# Copy tất cả file jar từ thư mục lib gốc vào
RUN cp lib/*.jar web/WEB-INF/lib/ || true

# === DỌN DẸP RÁC (Quan trọng) ===
# Xóa sạch các thư viện gây xung đột và thư viện API ảo
RUN rm -f web/WEB-INF/lib/jakarta.* \
          web/WEB-INF/lib/servlet-api.jar \
          web/WEB-INF/lib/jsp-api.jar \
          web/WEB-INF/lib/javax.servlet-api.jar

# Tải JSTL 1.2 chuẩn
RUN curl -L https://repo1.maven.org/maven2/javax/servlet/jstl/1.2/jstl-1.2.jar -o web/WEB-INF/lib/jstl-1.2.jar

# 3. Tải thư viện Tomcat 9 để lấy Servlet API (Dùng để Compile)
RUN mkdir -p /tmp/tomcat-libs && \
    curl -L https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz \
    | tar -xz -C /tmp/tomcat-libs --strip-components=1

# 4. BIÊN DỊCH CODE (JAVAC) - CÁCH MỚI
# Tạo thư mục chứa class
RUN mkdir -p web/WEB-INF/classes

# --- ĐÂY LÀ PHẦN SỬA LỖI ---
# Gom tất cả đường dẫn file .jar vào một biến CLASSPATH rõ ràng
# Bao gồm: Các thư viện trong web/WEB-INF/lib VÀ servlet-api.jar + jsp-api.jar của Tomcat
RUN LIBS=$(find web/WEB-INF/lib -name "*.jar" | tr '\n' ':') && \
    TOMCAT_LIBS="/tmp/tomcat-libs/lib/servlet-api.jar:/tmp/tomcat-libs/lib/jsp-api.jar" && \
    export CLASSPATH="$LIBS:$TOMCAT_LIBS" && \
    find src -name "*.java" > sources.txt && \
    javac -d web/WEB-INF/classes -cp "$CLASSPATH" @sources.txt

# Copy các file resource (xml, properties,...)
RUN find src -type f -not -name "*.java" -exec cp --parents {} web/WEB-INF/classes \; || true

# 5. Đóng gói WAR
RUN jar -cvf ROOT.war -C web .

# ========================
# Giai đoạn 2: Chạy Web App
# ========================
FROM tomcat:9.0-jdk11-openjdk-slim

# Xóa ứng dụng mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR
COPY --from=build /app/ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
