# --- Build Stage ---
FROM eclipse-temurin:17-jdk AS builder
WORKDIR /app

# Gradle wrapper とソースをコピー
COPY . .

# jar をビルド
RUN ./gradlew clean build -x test

# --- Runtime Stage ---
FROM eclipse-temurin:17-jdk
WORKDIR /app

# ビルド済み jar をコピー
COPY --from=builder /app/build/libs/todo-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
