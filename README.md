# Thc 7pine

First, the 7pine image was created to meet my needs to do some tests in a local environment.

## Getting Started

Getting started is easy, you can clone the 7pine project:


```

git clone git@github.com:guicsmts/thc-setpine.git
```

### Prerequisites

To build 7 pine you need to have the container tool, docker installed.

### Building 7pine

```
docker build -f path/to/Dockerfile -t your-tag/thc-7pine:1.0 .
```

After building the 7pine image, execute the following commands.

```
docker images
```

And 

```
docker run -d -it --name 7pine --volume $(pwd):/home/7pine/ your-tag/thc-7pine:1.0 sh
```

## Running the tests

Listing the running container and accessing 7pine container.

```
docker ps
CONTAINER ID        IMAGE                      COMMAND             CREATED             STATUS              PORTS               NAMES
7a661b62808d        fuckthesystem62/thc-7pine:1.0   "sh"                7 seconds ago       Up 5 seconds                            7pine
```

```
docker attach 7pine
/opt/metasploit-framework #
```
Md5 Dockerfile

```
MD5 (Dockerfile) = afd1502b30b76aecee379a9f5b400f51
```