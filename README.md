# SDR_Setup
Tools for receiving, transmitting, and decoding HF and other frequencies

Tools Contained in this repo:
GQRX
WSJT-X and dependencies
RTL-SDR Drivers
Audio apps


### Installing:

```
git clone https://github.com/cgilbert11/SDR_Setup
cd SDR_Setup
sh SDR_Setup_Part1.sh
```
#### Then, after first reboot

This step will take a while

```
cd SDR_Setup
sh SDR_Setup_Part2.sh
```
#### After Second Reboot
```
cd SDR_Setup
sh SDR_Setup_Part3.sh
```
### Setting up

#### GQRX Setup  
- Configure I/O device:  
 	- Select Device  
 	- Select Virtual_Sink for audio output device  
- Input Controls:  
	- Set “No Limits”  
- Receiver Options:  
	- Mode: USB  
- Tools  
	- Remote Control Settings: Write down allowed host  
	- Enable Remote Control  

#### WSJT-X Setup
- Settings
	- Radio
		- Rig: Hamlib.NET rig.ctl
		- Network Server: <allowed host from GQRX>
		- Test CAT - should turn green
		- Scroll to bottom - click ok
	- Audio
		- Input: Virtual_Sink.monitor
		- Output: default
	- Mode = FT8

### Receiving Signals
In GQRX, set frequency to 28.074 MHz
	- This is the 10m band of FT8 
	- The SDR Dongle has a range of about 25 – 1750 MHz  
Next, open WSJT-X and it should automatically be taking in data from GQRX  
	- WSJT-X may alter your frequency a bit so just change it back in GQRX
After all of this, you should start seeing FT8 10m messages coming through
