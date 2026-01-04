# Sử dụng JDK 17 (Tốt nhất cho Tomcat 10 / Jakarta EE)
FROM eclipse-temurin:17-jdk AS build
WORKDIR /app

# 1. Copy toàn bộ code
COPY . .

# 2. Chuẩn bị thư mục lib
RUN mkdir -p web/WEB-INF/lib

# Copy file jar cá nhân (nếu có), bỏ qua lỗi nếu không có file
RUN cp lib/*.jar web/WEB-INF/lib/ || true

# === QUAN TRỌNG: Tự động tải bộ thư viện Jakarta EE (Tomcat 10) ===
# Bước này đảm bảo trình biên dịch có đúng cái nó cần (jakarta.servlet)
# Tải API Servlet & JSP
RUN curl -L https://repo1.maven.org/maven2/jakarta/platform/jakarta.jakartaee-api/9.1.0/jakarta.jakartaee-api-9.1.0.jar -o web/WEB-INF/lib/jakarta-api.jar

# Tải JSTL bản mới nhất (tương thích Jakarta)
RUN curl -L https://repo1.maven.org/maven2/org/glassfish/web/jakarta.servlet.jsp.jstl/3.0.1/jakarta.servlet.jsp.jstl-3.0.1.jar -o web/WEB-INF/lib/jstl-impl.jar && \
    curl -L https://repo1.maven.org/maven2/jakarta/servlet/jsp/jstl/jakarta.servlet.jsp.jstl-api/3.0.0/jakarta.servlet.jsp.jstl-api-3.0.0.jar -o web/WEB-INF/lib/jstl-api.jar

# 3. BIÊN DỊCH
RUN mkdir -p web/WEB-INF/classes

# Gom tất cả file jar trong web/WEB-INF/lib vào classpath
# Lúc này trong lib đã có file jakarta-api.jar vừa tải ở trên -> Hết lỗi "cannot find symbol"
RUN LIBS=$(find web/WEB-INF/lib -name "*.jar" | tr '\n' ':') && \
    export CLASSPATH="$LIBS" && \
    find src -name "*.java" > sources.txt && \
    javac -d web/WEB-INF/classes -cp "$CLASSPATH" @sources.txt

# Copy các file không phải java (xml, properties...)
RUN find src -type f -not -name "*.java" -exec cp --parents {} web/WEB-INF/classes \; || true

# 4. Đóng gói WAR
RUN jar -cvf ROOT.war -C web .

# ========================
# CHẠY ỨNG DỤNG TRÊN TOMCAT 10
# ========================
FROM tomcat:10.1-jdk17

# Xóa app mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR đã build
COPY --from=build /app/ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
