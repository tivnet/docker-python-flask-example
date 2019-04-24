# Docker example: Python/Flask with Dockerfile and npm for MS Windows

* A simple Python/Flask application.
* A `Dockerfile` to build the image from Alpine Linux.
* A `package.json` file with a set of convenience scripts to build and run the image.
    * passing the configuration parameters from `package.json` to `Dockerfile` via `ARGs`.
* A `docker-compose.yml` file.
    
## Designed to be built and to run under MS Windows

* `Dockerfile` has commands to reset the file and folder permissions in the image.
*  Parameters in `package.json` use the `%param%` form (`$param` on Linux).
* Tested on MS Windows-10.

## Runs on AWS Elastic Beanstalk

* [Check it out](http://tivnetpyaws-env.sewfk5278e.us-east-1.elasticbeanstalk.com/)

### Author

* [Gregory Karpinsky](https://github.com/tivnet)
