FROM ubuntu:22.04
ADD bc /opt/bc
RUN apt-get update &&  apt-get install \
        libgl1 libgl1-mesa-glx \
        libxxf86vm1 libx11-6 \
        libc6 libstdc++6 \
        libgcc1 libasound2 \
        libportaudio2 libsndfile1 \
        fonts-noto gdb -y \
        && rm -rf /var/lib/apt/lists/*
RUN useradd -u 1000 -ms /bin/bash app -d /home/app
USER app 
WORKDIR /opt/bc/bin
CMD /opt/bc/bin/bridgecommand
