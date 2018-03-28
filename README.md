# apcupsd-raspi

## Summary

Code for building a Docker image with the <a href="http://www.apcupsd.org/">APC UPS Daemon</a> software on top of the latest <a href="https://hub.docker.com/r/arm32v7/debian/">ARM32v7/Debian:stretch-slim</a> release.
Allows metrics to be pulled from an APC UPS connected to a Raspberry Pi via USB (with USB device passthrough to Docker container).
Customized to work with <a href="https://github.com/clayshek/Pi-Data-WebApp">PiDataWebApp</a> Heroku web app.



## Usage

Customize `PIID` & `APIURL` environment variables in Dockerfile.

Customize image name in apcupsd-container-run script.

Config files in apc-config/ are modified to work with a basic setup, but further customization may be required. See <a href="http://www.apcupsd.org/manual/manual.html">APC documentation</a>.

Build image:
`docker build -t *image/name* .`

Edit image name in apcupsd-container-run.sh to match the image name used in the Build step. Copy script to cron.hourly directory to launch container every hour. Once copied, confirm root is the owner.

'sudo cp apcupsd-container-run /etc/cron.hourly'

Container should launch hourly, terminating and removing container when job completes.


## To-Do

 - [ ] Add logging 
 - [ ] Expose metrics for Prometheus / Grafana, ultimately replacing most of PiDataWebApp
 - [ ] Evaluate switching from Debian to Alpine to reduce image size
 - [ ] Evaluate change from container based to FaaS (OpenFaaS?)

## License

This is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT).
