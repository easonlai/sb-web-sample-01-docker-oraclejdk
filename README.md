# Sample Java Web App in Spring Boot framework with Containerization (with Oracle JRE 8 base image)
Readme update 1.0

## Build with Maven
```shell
mvn package
```

## Run locally
```shell
java -jar target/gs-spring-boot-docker-0.1.0.jar
```

## Test web app locally
```shell
http://localhost:8080
```

## Prepare Oracle JRE 8 base image
To build Oracle Server JRE 8 with Oracle Linux 7 Slim
Official build document : https://github.com/oracle/docker-images/tree/master/OracleJava
```shell
cd OracleServerJRE8-OracleLinux7SLIM
docker build -t oracleserverjre8-oraclelinux7slim .
```

## Containerize
1. Build a docker image using `Dockerfile` with Oracle JRE 8 base image:
   ```
   docker build -t sb-web-sample-01-docker-oraclejdk .
   ```
2. Run docker image locally
   ```
   docker run --rm -p 8080:8080 sb-web-sample-01-docker-oraclejdk
   ```
3. Then you can access the web app at http://localhost:8080 in browser.

Or you can pull this sample from my Docker Hub.
https://cloud.docker.com/u/easonlai/repository/docker/easonlai/sb-web-sample-01-docker-oraclejdk

## Deploy to K8S
```shell
kubectl apply -f sb-web-sample-01-docker-oraclejdk-kube.yaml
```

## Expose Internet Load Balancer in specific Subnet
Updated deployment yaml file (sb-web-sample-01-docker-kube-private.yaml) which updated annotations to make it specify to ping Internal Load Balancer into specific subnet (service.beta.kubernetes.io/azure-load-balancer-internal-subnet).
