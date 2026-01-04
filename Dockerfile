# Sử dụng JDK 17
FROM eclipse-temurin:17-jdk AS build
WORKDIR /app

# 1. Copy toàn bộ code
COPY . .

# 2. Chuẩn bị thư mục lib
RUN mkdir -p web/WEB-INF/lib

# Copy file jar cá nhân (nếu có), bỏ qua lỗi nếu không có
RUN cp lib/*.jar web/WEB-INF/lib/ || true

# === TỰ ĐỘNG TẢI THƯ VIỆN CẦN THIẾT ===

# 1. Tải Jakarta EE API (cho Servlet/JSP mới)
RUN curl -L https://repo1.maven.org/maven2/jakarta/platform/jakarta.jakartaee-api/9.1.0/jakarta.jakartaee-api-9.1.0.jar -o web/WEB-INF/lib/jakarta-api.jar

# 2. Tải JSTL (Thư viện thẻ JSP)
RUN curl -L https://repo1.maven.org/maven2/org/glassfish/web/jakarta.servlet.jsp.jstl/3.0.1/jakarta.servlet.jsp.jstl-3.0.1.jar -o web/WEB-INF/lib/jstl-impl.jar && \
    curl -L https://repo1.maven.org/maven2/jakarta/servlet/jsp/jstl/jakarta.servlet.jsp.jstl-api/3.0.0/jakarta.servlet.jsp.jstl-api-3.0.0.jar -o web/WEB-INF/lib/jstl-api.jar

# 3. [MỚI] Tải Tomcat Embed Core (Để sửa lỗi thiếu gói org.apache.tomcat.util...)
# File này chứa các class upload file mà code bạn đang import
RUN curl -L https://repo1.maven.org/maven2/org/apache/tomcat/embed/tomcat-embed-core/10.1.18/tomcat-embed-core-10.1.18.jar -o web/WEB-INF/lib/tomcat-embed-core.jar

# === BIÊN DỊCH ===
RUN mkdir -p web/WEB-INF/classes

# Gom tất cả file jar trong web/WEB-INF/lib vào classpath để biên dịch
RUN LIBS=$(find web/WEB-INF/lib -name "*.jar" | tr '\n' ':') && \
    export CLASSPATH="$LIBS" && \
    find src -name "*.java" > sources.txt && \
    javac -d web/WEB-INF/classes -cp "$CLASSPATH" @sources.txt

# Copy các file resource (xml, properties,...)
RUN find src -type f -not -name "*.java" -exec cp --parents {} web/WEB-INF/classes \; || true

# Đóng gói WAR
RUN jar -cvf ROOT.war -C web .

# === CHẠY ===
FROM tomcat:10.1-jdk17

# Xóa app mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR
COPY --from=build /app/ROOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
