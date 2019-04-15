FROM openjdk:11-jdk-slim AS builder

WORKDIR /usr/src/test
COPY Test.java /usr/src/test/

RUN javac Test.java



FROM openjdk:11-jre-slim

WORKDIR /opt/test
COPY --from=builder /usr/src/test/Test.class /opt/test

CMD java Test
