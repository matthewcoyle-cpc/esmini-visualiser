# esmini-visualiser
A tool which uses the [esmini OpenSCENARIO player](http://github.com/esmini/esmini) to generate video visualisations of scenarios

This container creates an Xvfb virtual display, executes Esmini which renders to the virtual display and uses avconv to record from the virtual display to a gif

Render and recording is done at 480x270 as default

## Getting Started

These instructions will cover usage information for the docker container 

### Prerequisities


In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Environment Variables

* `LENGTH` - Length in seconds of recording (default 20)
* `SCENARIO` - The xosc location relative to the scenarios volume
* `FRAMERATE` - The framerate to record at (default 20)
* `RESOLUTION` - The target resolution (default 320x240)
* `VIDEO_FORMAT` - Video file format extension (default gif, see [ffmpeg](https://ffmpeg.org/ffmpeg-formats.html) for supported formats)

#### Sample Usage

docker run -v ~/esmini/resources:/scenarios -e SCENARIO=xosc/cut-in.xosc -e LENGTH=20 -e VIDEO_FORMAT=mp4 matthewcoylecpc/esmini-visualiser

This will do the following:
* Execute the scenario ~/esmini/resources/xosc/cut-in.xosc
* Record a 20 second mpeg 4 video
* Output ~/esmini/resources/cut-in.mp4 and ~/esmini/resources/cut-in.dat

#### Volumes

* `/scenarios/` - The directory to pass in scenarios from and deliver output to

#### Useful File Locations

* `/root/esmini/bin/esmini` - esmini executable
  
* `~/run.sh` - Execution script

## Find Us

* [GitHub](https://github.com/matthewcoyle-cpc)
* [Connected Places Catapult](https://cp.catapult.org.uk/)

## Authors

* **Matthew Coyle**

## Acknowledgments

* Thanks to Emil Knabe for development of [esmini](https://github.com/esmini/esmini) including assisting the development of this container
