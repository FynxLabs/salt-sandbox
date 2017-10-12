# Saltstack Salt-Minion on Ubuntu 14.04

A Docker image which allows you to run salt-minion service with preinstalled docker.
The idea is to use salt-minion as tiny docker-based service bootstrap.

## Running the Container

You can easily run the container like so:

    docker run --rm -it fynxlabs/salt-minion

## Volumes

There is a volume with minion configuration:

 * `/etc/salt/minion.d` - master configuration

### Sharing Local Folders

To share folders on your local system so you can have your own minon configuration use:

    docker run -d                                   \
        -v /path/to/salt/conf:/etc/salt/minion.d    \
        --name salt-minion                          \
        fynxlabs/salt-minion

To use this container as salt/docker bootstrapper use following command:

    docker run -d                                       \
        -v /path/to/salt/conf:/etc/salt/minion.d        \
        -v /var/run/docker.sock:/var/run/docker.sock    \
        -v /data:/data                                  \
        --name salt-minion                              \
        fynxlabs/salt-minion

When you share `/var/run/docker.sock` all calls to docker executes on host side and all volume shares are taken from host too.
That is why we share `/data` directory. This allows us to use `file.managed` salt state with volume binding in `dockernq.running`.
