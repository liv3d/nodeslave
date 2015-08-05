FROM node:0.12

# list of available versions: http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/
ENV SWARM_VERSION=2.0

RUN \
    apt-get update && \
    apt-get -y install openjdk-7-jdk git ssh-client && \
    npm install -g gulp semistandard bower && \
    curl -o /swarm.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/${SWARM_VERSION}/swarm-client-${SWARM_VERSION}-jar-with-dependencies.jar && \
    rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin

CMD java -jar /swarm.jar -username $JENKINS_USERNAME -password $JENKINS_APIKEY -labels 'node swarm'
