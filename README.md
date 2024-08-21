

# Tempest Framework Docker Setup
This project is a docker implementation of [Tempest Framework](tempestsapp/LICENCE.md)

It provides a Docker setup for running a Tempest PHP application with Nginx as the web server.

It uses [Traefik](https://traefik.io/) to host the app in local. You can use the container exposed port as well if not using traefik and remove the all the "labels:" from docker-compose.yml file. The services use the `traefik` network, which should be created externally.

## Project Structure

- `docker-compose.yml`: Defines the services for the application
- `builder/Dockerfile`: Dockerfile builder for Tempest Framework
- `tempestsapp/`: Tempest Application code from composer
- `configs/`: Sample Configuration files for PHP and Nginx

## Services

1. `tempestapp`: PHP-FPM service running the Tempest application
2. `tempestweb`: Nginx service serving as the web server

## Getting Started

1. Clone this repository
2. Ensure Docker and Docker Compose are installed on your system
3. Copy the `configs/default.conf.SAMPLE` file to `configs/default.conf`
4. Edit `configs/default.conf` to replace domain, replace "ztempest.com" with your one.
4. Copy the `configs/local.ini.SAMPLE` file to `configs/local.ini`
5. Edit `docker-compose.yml` file for changing your local domain, replace "ztempest.com" with your one.
6. Run the following commands to deploy and build:
    ```bash
    docker-compose up -d --build
     ```
7. Access the application at http://ztempest.com or your own new local domain

### Development
The Tempest application code is mounted as a volume, allowing for live code changes without rebuilding the container.


### Guide to create new tempest project if you want to create from scratch
To create a new Tempest project, you can use:
```
composer create-project tempest/app <project-name>
cd <project-name>
npm run dev
```


### Additional Information
For more details about the Tempest framework, refer to the official documentation.


