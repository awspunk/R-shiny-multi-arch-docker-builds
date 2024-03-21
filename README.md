# Cross-Platform R Shiny Docker Images

This project focuses on creating Docker images for R Shiny applications that are optimized for cross-platform compatibility. By leveraging arm-based Docker images, we aim to achieve cost savings on AWS Graviton2 instances, which offer up to 40% better price-performance compared to traditional amd64 CPU architectures. Additionally, this project seeks to support the growing number of developers using Apple Silicon-based computers, by improving the developer workflow on these devices.

## Dockerfiles

The project includes two Dockerfiles designed for different CPU architectures:

- `Dockerfile` : For amd64 architectures.
- `Dockerfile.arm` : For arm architectures.

## Building Docker Images Locally

To build the Docker images for both amd64 and arm architectures, use the following commands:

**For amd64:**

`docker build -t hello:latest .`

**For arm:**

`docker build -f Dockerfile.arm -t hello:latest .`

## Running with Docker Compose

You can launch the application using Docker Compose, with separate configurations for arm and amd64 architectures:

For arm:

`docker-compose -f docker-compose.arm.yml up --build -d`

For amd64:

`docker-compose up --build -d`

## Using Pre-Built Images

For convenience, pre-built images are available and can be run directly:

`docker run -d -p 3838:3838 --name hello awspunk/hello:latest`

Once the container is running, the R Shiny application can be accessed at: http://localhost:3838/hello

The repository provides Docker images for both arm and amd64 architectures. Docker will automatically select the appropriate image based on your machine's CPU architecture, facilitating seamless deployment across different platforms.
