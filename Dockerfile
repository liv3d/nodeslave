FROM node:0.12

RUN \
    npm install -g gulp semistandard bower && \
    curl -o /swarm.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/1.22/swarm-client-1.22-jar-with-dependencies.jar

CMD java -jar /swarm.jar -username $JENKINS_USERNAME -password $JENKINS_APIKEY -labels 'node swarm'
