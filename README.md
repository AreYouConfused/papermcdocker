# papermcdocker
A docker container for running a papermc minecraft server  
view on [docker hub](https://hub.docker.com/r/stillconfusing/papermc)

# running
specify the minecraft version with the environment variable `MC_VERSION`

replace the numbers in `< >` with your prefered options
```
docker run -dit --name "<papermc>" -p <25565>:25565 -v <paperserver>:/opt/papermc/server -e MC_VERSION="<latest>" stillconfusing/papermc:latest
```
