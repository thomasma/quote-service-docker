Spring Boot Service Packaged in Docker Container
=======

Simple Spring Boot RESTful service that calls an externally hosted quote service to retrieve a random Chuck Norris jokes. Package and run this in a docker container


### Run the Application without Docker
      mvn clean spring-boot:run
      curl http://localhost:8080/quotes/
The curl command above should return a JSON response with the random quote.

### Actuator endpoint
    curl http://localhost:8080/health 
    curl http://localhost:8080/env
    curl http://localhost:8080/info
    curl http://localhost:8080/metrics
    

### Using Docker
Make sure you install and run docker on your machine. Once installed open a new terminal and run

    docker ps (this should return a list of running containers)
    docker images (to list all images)
    docker rmi -f image_id (to force delete an existing image)
    mvn clean package (to ensure your boot jar is generated in target folder)
    docker build -t quote-service . (to build docker image)
    docker run -p 8080:8080 quote-service (run the container from the image created in previous step. logs should show on stdout)

Run the previously shown curl commands. Assuming you have no issues with the docker image you will get the same response. See the Dockerfile for the docker packaging information.

### Using Docker Compose
See the docker-compose.yml file
   docker swarm init
   docker stack deploy -c docker-compose.yml quoter
   docker service ps quoter_web

I found that it took a really long time for my service to get up and running (like 10 minutes). 
   curl http://localhost:8080/quotes/


To take the app down and exit swarm
   docker stack rm quoter
   docker swarm leave --force

