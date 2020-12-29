FROM thewtex/opengl:ubuntu1804

WORKDIR ~/

RUN apt-get -yqq update && apt-get -yq install build-essential git pkg-config libgl1-mesa-dev libpthread-stubs0-dev libjpeg-dev libxml2-dev libpng-dev libtiff5-dev libgdal-dev libpoppler-dev libdcmtk-dev libgstreamer1.0-dev libgtk2.0-dev libcairo2-dev libpoppler-glib-dev libxrandr-dev libxinerama-dev curl cmake wget ffmpeg mkvtoolnix xvfb unzip && apt-get autoremove -y && apt-get clean -y

RUN curl -L -o esmini.zip https://github.com/esmini/esmini/releases/latest/download/esmini-bin_ubuntu.zip && \
unzip esmini.zip -d /root/esmini

ENV DISPLAY=:1.0
ENV LENGTH=20
ENV RESOLUTION=480x270
ENV FRAMERATE=20
ENV VIDEO_FORMAT=gif
COPY ./run.sh ~/
RUN ["chmod", "+x", "~/run.sh"]
ENTRYPOINT ["~/run.sh"]
