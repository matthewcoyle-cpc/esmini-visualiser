# esmini-visualiser
A tool which uses the esmini OpenSCENARIO player to generate video visualisations of scenarios

This container creates an Xvfb virtual display, executes Esmini which renders to the virtual display and uses avconv to record from the virtual display to a gif
Render and recording is done at 320x240

## Getting Started

These instructions will cover usage information for the docker container 

### Prerequisities


In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Environment Variables

* `LENGTH` - Length in seconds of recording
* `SCENARIO` - The xosc location relative to the scenarios volume

#### Sample Usage

docker run -v ~/esmini/scenarios:/scenarios -e SCENARIO=M804/M4.xosc -e LENGTH=20 matthewcoylecpc/esmini-visualiser

This will do the following:
* Execute the scenario ~/esmini/scenarios/M804/M4.xosc
* Record a 20 second gif
* Output to ~/esmini/scenarios/M804/M4.gif


#### Volumes

* `/scenarios/` - The base directory used to pass in scenarios

#### Useful File Locations

* `/root/esmini/build/EnvironmentSimulator/EgoSimulator/EgoSimulator` - Esmini executable
  
* `~/run.sh` - Execution script

## Find Us

* [GitHub](https://github.com/matthewcoyle-cpc)
* [Connected Places Catapult](https://cp.catapult.org.uk/)

## Authors

* **Matthew Coyle**

## Acknowledgments

* Thanks to Emil Knabe for development of Esmini including assisting the development of this container
