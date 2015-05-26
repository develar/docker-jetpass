FROM develar/java:8u45
MAINTAINER Vladimir Krivosheev <develar@gmail.com>

WORKDIR app

COPY jetbrains.jetpass.server.jar ./

ENV _JAVA_OPTIONS "-Xms48m -Xmx64m"

EXPOSE 80

ENTRYPOINT ["java", "-Djava.awt.headless=true","-Djava.security.egd=file:/dev/urandom", \
  "-Djetbrains.youtrack.disableBrowser=true", "-Djetty.home=/data", "-Djetbrains.jetpass.database.location=/data/data", "-jar", "jetbrains.jetpass.server.jar", "80"]