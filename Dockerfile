# ========================
# Giai đoạn 1: Build Thủ Công (Không dùng Ant)
# ========================
FROM eclipse-temurin:11-jdk AS build
WORKDIR /app

# 1. Copy toàn bộ source code
COPY . .

# 2. Chuẩn bị thư mục chứa thư viện (web/WEB-INF/lib)
RUN mkdir -p web/WEB-INF/lib

# Copy tất cả file jar từ thư mục lib gốc vào (nếu có)
RUN cp lib/*.jar web/WEB-INF/lib/ || true

# === QUAN TRỌNG: Dọn dẹp thư viện rác gây lỗi ===
RUN rm -f web/WEB-INF/lib/jakarta.* \
          web/WEB-INF/lib/servlet-api.jar \
          web/WEB-INF/lib/jsp-api.jar \
          web/WEB-INF/lib/javax.servlet-api.jar

# Tải JSTL 1.2 chuẩn cho Tomcat 9
RUN curl -L https://repo1.maven.org/maven2/javax/servlet/jstl/1.2/jstl-1.2.jar -o web/WEB-INF/lib/jstl-1.2.jar

# 3. Tải thư viện Tomcat (Servlet API) để phục vụ biên dịch (Compile)
# (Chúng ta cần nó để code Java hiểu request/response là gì)
RUN mkdir -p /tmp/tomcat-libs && \
    curl -L https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz \
    | tar -xz -C /tmp/tomcat-libs --strip-components=1

# 4. BIÊN DỊCH CODE JAVA (JAVAC)
# Tạo thư mục chứa class
RUN mkdir -p web/WEB-INF/classes

# Tìm tất cả file .java trong thư mục src và biên dịch
# Classpath bao gồm: Thư viện trong WEB-INF/lib + Thư viện của Tomcat
RUN find src -name "*.java" > sources.txt && \
    javac -d web/WEB-INF/classes \
    -cp "web/WEB-INF/lib/*:/tmp/tomcat-libs/lib/*" \
    @sources.txt

# Copy các file resource (không phải .java) từ src sang classes (ví dụ: file properties, xml nếu có)
RUN find src -type f -not -name "*.java" -exec cp --parents {} web/WEB-INF/classes \; || true

# 5. Đóng gói thành file WAR
# Dùng lệnh jar để nén thư mục web lại
RUN jar -cvf ROOT.war -C web .

# ========================
# Giai đoạn 2: Chạy Web App
# ========================
FROM tomcat:9.0-jdk11-openjdk-slim

# Xóa ứng dụng mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR chúng ta vừa tự gói vào
COPY --from=build /app/ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
