FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install -y curl

# Install JDK
RUN apt-get -y install openjdk-8-jdk wget unzip
RUN java -version

# Download and install Gradle
RUN \
    cd /usr/local && \
    curl -L https://services.gradle.org/distributions/gradle-4.4.1-bin.zip -o gradle-4.4.1-bin.zip && \
    unzip gradle-4.4.1-bin.zip && \
    rm gradle-4.4.1-bin.zip

# Export some environment variables
ENV GRADLE_HOME=/usr/local/gradle-4.4.1
ENV PATH=$PATH:$GRADLE_HOME/bin JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

RUN gradle -v

# Install Node.js
RUN apt-get install --yes curl
RUN curl --silent --location https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential

RUN echo "Node:" && node -v
RUN echo "NPM:" && npm -v

