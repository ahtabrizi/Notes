# V4l2loopback Notes 

## Installation 

- Update Linux headers to match the kernel (this is a must)

 ```shell
 sudo apt-get install linux-headers-$(uname -r)
 ```
- then run this command to clear remaining stuff:
 
 ```shell
sudo apt autoremove
 ```
- to install the module run "make install" (you might have to be 'root' to have all necessary permissions to install the module).

 ```shell
make && sudo make install
sudo depmod -a
 ```
- then you are good to go. just run the following  to create the device

 ```shell
sudo modeprobe v4l2loopback
 ```
this will create an additional video-device, e.g. /dev/video0 (the number depends on whether you already had video devices on your system), which can be fed by various programs. 

 ***THIS COMMAND SHOULD BE EXECUTED AFTER EVERY STARTUP. CREATED DEVICES WILL BE REMOVED AFTER STARTUP.***

# How to use
**NOTE** all of the following methods are gstreamer commands. for more detailed info refer to [GStreamer Notes](gstreamer.md)
## Get another copy of existing device
device0 will be a producer that gets frames from camera

device1 will become consumer and each frame of device0 can be accessed from it 

- Run each command in seperate Terminals 
 
**Producer**
```shell
# will capture images at the highest possible resolution 
gst-launch-1.0 v4l2src device=/dev/video0  ! v4l2sink device=/dev/video1

# adding "caps filter" to select desired format and size
gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-raw,format=YUY2,width=640,height=480,framerate=30/1 ! v4l2sink device=/dev/video1
```
**Consumer**
```shell
gst-launch-1.0 v4l2src device=/dev/video1 ! xvimagesink
```
## Video as a producer
### AVI Format
play `test.avi` video with gstreamer
```shell
gst-launch-1.0 filesrc location=test.avi ! avidemux ! decodebin ! xvimagesink
```
play `test.avi` video file in a v4l2 device that can act as a camera. caps filter and `tee` elements are essential for running it
```shell
gst-launch-1.0 -v filesrc location=test.avi ! avidemux ! decodebin ! videoconvert ! "video/x-raw,format=YUY2" ! tee ! v4l2sink device=/dev/video1
```
### MP4 Format
play `night.mp4` video with gstreamer
```shell
# Only video
gst-launch-1.0 filesrc location=night.mp4 ! decodebin name=dec ! videoconvert ! autovideosink

# with Audio
gst-launch-1.0 filesrc location=night.mp4 ! decodebin name=dec ! videoconvert ! autovideosink dec. ! audioconvert ! audioresample ! alsasink

# with QuickTime runtime (used to get the trace of execution ???)
gst-launch-1.0 filesrc location=night.mp4 ! qtdemux name=demux demux. ! queue ! faad ! audioconvert ! audioresample ! autoaudiosink demux. ! queue ! avdec_h264 ! videoconvert ! autovideosink
```
 - Note that the `dec.` after `autovideosink` means "what follows is a data flow branch that begins in parallel with `videoconvert`, using data from the element named `dec` (which is decodebin). `autovideosink` has no source (output) terminal; no data flows out of it to `audioconvert`, but this notation is used to represent a data flow branch on one console line. [Thanks to [Thagomizer](https://stackoverflow.com/users/2288372/thagomizer)]

play `night.mp4` video file in a v4l2 device that can act as a camera. caps filter and `tee` elements are essential for running it
```shell
gst-launch-1.0 filesrc location=night.mp4 ! decodebin name=dec ! videoconvert ! "video/x-raw,format=YUY2" ! tee ! v4l2sink device=/dev/video1

# other method (works almost everywhere)
gst-launch-1.0 filesrc location=night.mp4 ! qtdemux name=dmux dmux.video_0 ! queue ! h264parse ! omxh264dec  ! videoconvert ! "video/x-raw,format=YUY2" ! tee ! v4l2sink device=/dev/video2
```
