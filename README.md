# docker-php-5.6-zray
Uses official PHP 5.6 Docker image (Apache) and adds Z-Ray functionality (Technical Preview).
See http://www.zend.com/en/products/z-ray/z-ray-preview to get more info.

## Building
As the image is not (yet) available in the Docker hub, you have to build it yourself with
```
docker build -t php-5.6-zray .
```
Please follow the official docs on how to add your php scripts:
https://github.com/docker-library/docs/tree/master/php
## Running
Please type 
```
docker run -d -P php-5.6-zray
```
in order to start the container. Please call next
```
docker logs <CONTAINER_ID>
```
This command will display some useful information for accessing your app and the Z-Ray administration page. Due to a prerequesite of Z-Ray you currently have to access the app as well as the administration UI via the IP address of the container and not with localhost and the mapped port.
