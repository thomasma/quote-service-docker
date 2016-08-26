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
    

### Dockerize it
Make sure you install and run docker on your machine. Once installed open a new terminal and run

    docker ps (this should return a list of running containers)
    docker images (to list all images)
    docker rmi if image_name (to force delete images)
    mvn clean package (to ensure your boot jar is generated in target folder)
    docker build -t test/quote . (to build docker image)
    docker run --rm -it -p 8080:8080 test/quote (run run the container from the image created in previous step. logs should show on stdout)

Run the previously shown curl commands. Assuming you have no issues with the docker image you will get the same response. See the Dockerfile for the docker packaging information.