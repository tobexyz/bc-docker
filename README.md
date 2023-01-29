1. build bc locally https://github.com/bridgecommand/bc
2. cp bc folder to docker build context
3. build docker image
```docker build . -t bc```
4. allow xserver connections from local 
```xhost +local:root```
5. run image
```docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --privileged bc```


# Start with special ini
```docker network create --driver=bridge --subnet=10.0.0.0/24 bcnet```

```docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/snd:/dev/snd -v $(pwd)/bc5-radar.ini:/opt/bc/bin/bc5.ini --network bcnet --privileged -h radar bc ```

```docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/snd:/dev/snd -v $(pwd)/bc5-slave-left.ini:/opt/bc/bin/bc5.ini --network bcnet --privileged -h left bc```

```docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/snd:/dev/snd -v $(pwd)/bc5-slave-right.ini:/opt/bc/bin/bc5.ini --network bcnet --privileged -h right bc```

```docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/snd:/dev/snd -v $(pwd)/hostname.txt:'/home/app/.Bridge Command/5.8/hostname.txt' -v $(pwd)/bc5-master.ini:/opt/bc/bin/bc5.ini --network bcnet --privileged -h master bc```
