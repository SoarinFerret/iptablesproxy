# IPTablesProxy

IPTablesProxy is a quick invention using iptables allowing proxying of external services. By default, it will proxy any traffic it receives. To run it on its own:

```bash
$ docker run -it --rm -e SERVERIP='172.217.9.46' --cap-add=NET_ADMIN -p 8080:80 soarinferret/iptablesproxy
```

Optionally, you can define `SERVERIP` and `HOSTIP` to specify a specific TCP port mapping.

```bash
$ docker run -it --rm -e SERVERIP='172.217.9.46' -e SERVERPORT='3200' -e HOSTPORT='80' --cap-add=NET_ADMIN -p 8080:80 soarinferret/iptablesproxy
```

## Env Options

* `SERVERIP` - The IP address of the server you are proxying
* `SERVERPORT` - The Port being used by the server you want to proxy (optional)
* `HOSTPORT` - Port on the container you plan to expose the port with. This doesn't have to be the same as `SERVERPORT` (optional)

## Build it yourself

Nothing special to build this - but if you want to make sure you have the most up to date alpine source, here ya go:

```bash
$ docker build -t iptablesproxy .
```
