FROM gcr.io/ssr-sandbox/ssr_base_cpu:latest


ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get autoclean
RUN apt-get autoremove 
RUN apt-get update \
    && apt-get install -y openjdk-8-jdk unzip 

RUN wget https://services.gradle.org/distributions/gradle-5.2.1-bin.zip -P /tmp
RUN unzip -d /opt/gradle /tmp/gradle-*.zip

RUN echo "export GRADLE_HOME=/opt/gradle/gradle-5.2.1\nexport PATH=/opt/gradle/gradle-5.2.1/bin:${PATH}" > /etc/profile.d/gradle.sh
RUN echo "source /etc/profile.d/gradle.sh" >> /root/.bashrc