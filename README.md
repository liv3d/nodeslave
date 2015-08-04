# nodeslave

A simple Jenkins nodeslave (Node 0.12) using Swarm. Best launched using:

```
  docker run -d \
   -e JENKINS_USERNAME='username_or_email'\
   -e JENKINS_APIKEY='getapikey'\
   --link jenkins-ci:hostname.of.jenkins \
   nodeslave
```

The hostname is important so that Swarm can connect up the slave without using the public hostname. This allows you to keep Jenkins in a single host.
