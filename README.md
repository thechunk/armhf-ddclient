# armhf-ddclient

Based on Alpine Linux to be small

You can (and need) to connect your own /etc/ddclient to the container so it get your ddclient.conf.
You can connect your own /var/cache/ddclient to keep your running environment between starts.

To start :
```bash
docker build -t armhf-ddclient .
docker run -d -v ~/etc/ddclient:/etc/ddclient -v ~/var/ddclient:/var/cache/ddclient --name ddclient --restart=always armhf-ddclient
```
