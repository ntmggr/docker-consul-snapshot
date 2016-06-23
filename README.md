# docker-consul-shapshot
Dockerized [consul-snapshot](https://github.com/pshima/consul-snapshot)

## Build
`cd Dockerfile && docker build -t consul-snapshot .`

## Run in backup mode
`docker run --name consul-snapshot consul-snapshot`

## Run in restore mode
`docker run --name consul-snapshot consul-snapshot restore`

### Override environment variables
`docker run --name consul-snapshot -e S3BUCKET=microservices-devops -e S3REGION=us-west-2 -e BACKUPINTERVAL=60 -e CONSUL_HTTP_ADDR=172.17.0.1:8500 consul-snapshot`

## Configuration 
Configuration is done from environment variables passed to the container.

    S3BUCKET (the s3 bucket where backups should be delivered)
    S3REGION (the region the s3 bucket is located)
    AWS_ACCESS_KEY_ID (the access key id used to access the bucket)
    AWS_SECRET_ACCESS_KEY (the secret key used to access the bucket)
    BACKUPINTERVAL (how often you want the backup to run in seconds)

And through the consul api there are several options available (https://github.com/hashicorp/consul/blob/master/api/api.go#L126)

    CONSUL_HTTP_ADDR (default: 127.0.0.1:8500)
    CONSUL_HTTP_TOKEN (default: nil)
    CONSUL_HTTP_AUTH (default: nil)
    CONSUL_HTTP_SSL (default: nil)
    CONSUL_HTTP_SSL_VERIFY (default: nil)
