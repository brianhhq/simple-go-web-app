Branch|Build Status
--------|--------------
Master|[![CircleCI](https://circleci.com/gh/brianhhq/simple-go-web-app.svg?style=svg)](https://circleci.com/gh/brianhhq/simple-go-web-app)

# Simple Go Web App
The purpose of this project demos how simple go application work.

# AWS Infrastructure
See: [terraform/README.md](terraform/README.md)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

What things you need to install the software and how to install them.
* Download and install [Docker](https://www.docker.com/get-started)

### Installing

Download the images via command line

```
docker login
docker pull brianhhq/simple-go-web-app
```

### Usage

* Run the application
```         
docker run -d --name simple-go-web-app -p 8080:8080 brianhhq/simple-go-web-app
```


## Local Development - Go
### Build the app
```
go build main.go
```
### Run the app
```
./main
```
or 
```
go run main.go
```

## Local Development - Docker

* Clone this project

* How to Build image
```
docker build -t brianhhq/simple-go-web-app .
```

* Run the application `See Above`

* Enter the Container
```
docker exec -it simple-go-web-app sh
```

* Stop and Clean up
```
docker stop simple-go-web-app && docker rm simple-go-web-app
```
