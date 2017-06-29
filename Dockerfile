FROM node:0.12

# list of available versions: http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/
ENV SWARM_VERSION=2.0

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list
RUN apt-get update && apt-get -y install git ssh-client
RUN apt-get install -y -t jessie-backports openjdk-8-jdk
RUN npm install -g gulp semistandard bower
RUN curl -o /swarm.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${SWARM_VERSION}/swarm-client-${SWARM_VERSION}-jar-with-dependencies.jar
RUN rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin

CMD java -jar /swarm.jar -username $JENKINS_USERNAME -password $JENKINS_APIKEY -labels 'node swarm'
