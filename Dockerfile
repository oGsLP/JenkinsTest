FROM openjdk:8-jdk-alpine
COPY target/demo-0.0.1-SNAPSHOT.jar HelloWordTest.jar
ENV JAVA_OPTS="-Xmx200m"
EXPOSE 8090
CMD ["sh", "-c", "java $JAVA_OPTS -jar HelloWordTest.jar"]