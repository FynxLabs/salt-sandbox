# Docker - Salt Sandbox

Setup borrowed from [greendwin](https://github.com/greendwin/docker-tech) that sets up a Docker Master and Salt Minion to test different salt scenarios.

## Info

### Build
* OS: Ubuntu 16.04
* Salt Master:
* Salt Minion: 2017.

### List of images

#### Current
 * `salt-master` - Salt-Master Setup
 * `salt-minion` - Base Salt-Minion Image
#### Planned
* `Jenkins` - Salted Jenkins Setup
* `AWS` - Minion that Configures/Manages AWS services
* ``

## Usage

### Running example setup

On Windows machine you should first startup virtual machine using `vagrant`.

    vagrant up

In created machine or your host Linux machine you can startup master & minion containers:

	docker-compose up -d

Test connection to minion and provision minion machine:

	docker-compose exec master bash
	$ salt '*' test.ping
	$ salt '*' state.apply

### Development startup

To start development version (e.g. with altered docker images) you can use development overrides in `docker-compose.develop.yml`:

    ./compose-develop.sh

or you can do this manually:

    docker-compose                     \
        -f docker-compose.yml          \
        -f docker-compose.develop.yml  \
        up -d --build
