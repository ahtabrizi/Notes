# Gstreamer Notes 

If there is errors regarding Missing Plugin or decoder
```shell
# install gstreamer plugins
sudo apt-get install gstreamer1.0-plugins-good

# install missing multimedia extras plugins
sudo apt install ubuntu-restricted-extras
```

## Gstreamer cheat sheet
nice examples for Gstreamer, especially [gst-launch](http://wiki.oz9aec.net/index.php/Gstreamer_cheat_sheet)

cool gstreamer examples for every kind of device even RPi by Amazon.[link](https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/examples-gstreamer-plugin.html)

## some useful stuff
### [videotestsrc](https://gstreamer.freedesktop.org/documentation/videotestsrc/index.html?gi-language=c#factory-details)
 The videotestsrc element is used to produce test video data in a wide variety of formats. The video test data produced can be controlled with the "pattern" property. **Check video formats mentioned in src(Also called "caps filter")**
 - do-timestamp 
 - is-live
 - num-buffers
 - pattern

### [v4l2src](https://gstreamer.freedesktop.org/documentation/video4linux2/v4l2src.html?gi-language=c)
 v4l2src can be used to capture video from v4l2 devices, like webcams. **Check video formats mentioned in src(Also called "caps filter")**
 - do-timestamp --- Default value : false
 - device --- Default value : /dev/video0
 - device-fd 
 - flags -> V4l2device-type-flags -> capture, overlay, ...
 - iomode -> V4l2iomode -> dmabuf, mmap , ...
 - force-aspect-ratio --- Default value: true
 - extra-controls GstStructure : Additional v4l2 controls for the device

#### Text Overlay
add text to the video stream
```shell
gst-launch videotestsrc ! textoverlay text="Hello" ! ximagesink
```

#### Time Overlay
Elapsed time can be added. Timeoverlay inherits the properties of `textoverlay`.
```shell
gst-launch -v videotestsrc ! \
   timeoverlay halign=left valign=bottom text="Stream time:" shaded-background=true ! xvimagesink
```
Instead of elapsed time, the system date and time can be added using the `clockoverlay`.

#### Encoding and Muxing
#### Decoding and Demuxing
#### Network Streaming

#### Note
 - use `videoconvert` instead of `ffmpegcolorspace`
 - use `avdec_h264` instead of `ffdec_h264`
 - use `gst-launch-1.0` instead of `gst-launch-0.10`
 - Since 1.14, the use of libv4l2 has been disabled due to major bugs in the emulation layer. To enable usage of this library, set the environment variable `GST_V4L2_USE_LIBV4L2=1`

    But we use `gst-launch-1.0`, so it's OK I guess.

