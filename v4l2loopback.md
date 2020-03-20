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
 $ make && sudo make install
 $ sudo depmod -a
 ```
- then you are good to go. just run the following  to create the device

 ```shell
sudo modeprobe v4l2loopback
 ```

this will create an additional video-device, e.g. /dev/video0 (the number depends on whether you already had video devices on your system), which can be fed by various programs. 

## Usage - get another copy of existing device
device0 will be a producer that gets frames from camera

device1 will become consumer and each frame of device0 can be accessed from it 

- Run each command in seperate Terminals 
 
**Producer**
```shell
gst-launch-1.0 v4l2src device=/dev/video0  ! v4l2sink device=/dev/video1
```
**Consumer**
```shell
gst-launch-1.0 v4l2src device=/dev/video1 ! xvimagesink
```


