# docker-consul-shapshot
Runs [consul-snapshot](https://github.com/pshima/consul-snapshot)

## Build
`cd Dockerfile && docker build -t consul-snapshot .`

## Run
docker run --name consul-snapshot consul-snapshot

### Override environment variables
`docker run --name consul-snapshot -e S3BUCKET=microservices-devops -e S3REGION=us-west-2 -e BACKUPINTERNAL=60 -e CONSUL_HTTP_ADDR=172.17.0.1:8500 consul-snapshot`