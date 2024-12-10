

# ThermalTake 

My adventure & notes of getting TT RGB Plus 2.0 to work on linux using WINE


# Noticable issues 

- [ ] Software cannot add spcific registry keys 

- [ ] Software cannot access usb controller using winusb\_get\_device\_list

logging from earlier 
'''bash

0b08:err:ntoskrnl:ZwLoadDriver failed to create driver L"\\Registry\\Machine\\System\\CurrentControlSet\\Services\\HWiNFO_191": c0000024
0b40:err:ntoskrnl:ZwLoadDriver failed to create driver L"\\Registry\\Machine\\System\\CurrentControlSet\\Services\\HWiNFO_191": c0000024
::checkProgram_UI 11173
libusb: info [winusb_get_device_list] The following device has no driver: 'USB\VID_26CE&PID_0
1A2\272&0&7&1'
libusb: info [winusb_get_device_list] libusb will not be able to access it
libusb: info [winusb_get_device_list] The following device has no driver: 'USB\VID_04E8&PID_6
860&MI_02\512&1028&3&2'
libusb: info [winusb_get_device_list] libusb will not be able to access it
libusb: info [winusb_get_device_list] The following device has no driver: 'USB\VID_1B1C&PID_1
BA6&MI_03\512&1286&1&3'
libusb: info [winusb_get_device_list] libusb will not be able to access it
libusb: info [winusb_get_device_list] The following device has no driver: 'USB\VID_1B1C&PID_1
BA6&MI_00\512&1286&1&3'
libusb: info [winusb_get_device_list] libusb will not be able to access it
libusb: info [winusb_get_device_list] The following device has no driver: 'USB\VID_1B1C&PID_1
BA6\512&1286&5&4'
'''


Problem : WINE cannot communicate to the USB controller which is primarilly used to write instructions to the LED's and commands. Profiles as well.   

# What is USB\VID_1b1C&PID_1

* A usb identifier 

* The USB\VID_1B1C is an identifer for the manufacturer of the device , in this case 1B1C means "Corsair Components"

* 04E8 is Samsung 

* 26CE is ASRock 

* Can you passthrough the USB devices to WINE 

* Redirect USB devices over network to wine env ? 

- [x] Install winusb drivers in wine using Zadig ? ( DIDN'T WORK )

script to use Zadig to automate installing all the WinUSB drivers for wine ? 

* allow wine to add windows registry keys ?


THIS CAN WORK I SWEAR , I WILL MAKE IT SO 


# Where does wine store it's windows registry keys ? 

wine stores the registry keys in teh ~/.wine directory. file is located at /home/<user>/.wine/system.reg , user keys in user.reg and so on 


# What was the logging about the registry key from before 

WINE was saying that a windows app tried to load a kernel mode driver . Wine doesn't support Windows Kernel Drivers directly cause it doesn't WANT to replicate the windows kernel. Most of what it does is translate Windows API calls to POSIX system 
calls. 


# why doesn't wine support usb drivers? 

* windows uses it's own usb stack which and translating the two would take signifigant modifications to the kernel 



