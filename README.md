# Rancher Redis/Sentinel

This brings the upstream repo into modern Rancher and deploys a 3-node Redis/Sentinel cluster on Rancher. It utilizes Rancher's metadata service to identify and connect the nodes, allowing leader election, failover, and other service functionality.

This is slightly more than a POC. There is a client container that you can use to poke around at the cluster. 

You can deploy it by copying in the `docker-compose.yml` and `rancher-compose.yml` files, or if you wish to build the containers yourself, do so and then update the configs to point to your own registry.

If you're looking at this on Docker Hub, there are two parts:

- [rancher-redis](https://hub.docker.com/r/monachus/rancher-redis/)
- [rancher-redis-sentinel](https://hub.docker.com/r/monachus/rancher-redis-sentinel/)

