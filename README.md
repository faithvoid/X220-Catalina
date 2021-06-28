# Lain's X220 macOS Catalina Repository
A repository of information and kexts for running macOS Mojave on Thinkpad X/T/L420 laptops. Largely based off of x-t's x220-catalina-efi repository, but hopefully with a few quality of life adjustments to help the X220 work as a stable daily driver without external hardware modifications. Please feel free to make your own forks of this repository to help keep the 220 series a solid choice for a Hackintosh laptop!

*Please be respectful of the fact that I may not be able to provide too much support for this. I'll update it regularly as new discoveries and modifications are made, but I very frequently take breaks from GitHub due to health issues and cannot be relied on for tech support. Consider this repo a starting point more than a finished product until stated otherwise. Thank you and stay safe!*

If you would like to donate so I can test out additional Thinkpad hardware (including repairing my X1C1 to further optimize macOS potential), my PayPal is [here!](https://www.paypal.com/donate/?cmd=_s-xclick&hosted_button_id=8GF4A3XS7ZHFY) 

# Lain's X220T Specs:
- Model: N/A (coming soon!)
- BIOS: McDonellTech's modified v1.46 BIOS (not fully necessary in case you're worried about bricking your system, but will definitely help improve RAM speeds, CPU performance and battery life in macOS. The BIOS installation will fail a few times so keep your laptop connected and let it run it's course until it reboots!)
- CPU: Intel Core i5-2520M @ 2.5GHz
- GPU: Intel HD Graphics 3000 
- RAM: 12GB DDR3L SODIMM RAM (4+8GB)
- Bluetooth Card: Broadcom BCM92070
- Wireless Card: Intel Corporation Centrino Advanced-N 6205 

## What Works:
Virtually everything that isn't listed below.

## What Doesn't Work:
- Bluetooth (Not sure why, any advice on this matter would be appreciated! Probably just missing a kext or two.)
- X220T: Tablet Screen Buttons (I know there's definietly a way to remap them, as I did in macOS Sierra years ago, but I've forgotten how, haha.)
- Encrypted Partitions: I don't know if my macOS USB is just faulty or what, but during my initial installations neither APFS Encrypted nor HFS encrypted would allow me to finish the installation. This may just be an oversight on my end, but don't try to encrypt your drive if you're not prepared to troubleshoot (using -v in Clover didn't provide me too much human-readable 
- The touchpad settings screen is just blank, so you can't modify any options. There are definitely dozens of threads on many forums about this issue and possible solutions, I just haven't bothered with any yet since the default settings work well enough for me.

## Untested:
- Facetime / iMessage / etc. (I don't have an iPhone to use iMessage with so YMMV. You'll most likely need an intricate knowledge of modifying your config.plist with valid serial numbers to get either of these to work, as I've never gotten this to work on the first attempt of any Hackintosh.)
- Mini-Displayport output
- Bluetooth Hand-Off (due to no Bluetooth support at the moment.)
- Airport (read under troubleshooting to give it a shot!)
- Lots of other things, I'm sure. 

# TL;DR Installation Guide (there are more concrete guides online, but this is a short step-by-step that assumes you have at least a fledgling amount of Hackintosh literacy.)
- Using a MacOS device/VM (or Windows/Linux, but support will not be provided for that here but a quick Google search will provide tons of resources), use dosdude1's Catalina patcher to create a bootable 16+GB USB device. 
- Once the device has been created, go to the EFI partition of the USB device and replace the contents with the EFI folder of this repository.
- Boot into macOS, go to Disk Utility, then format your disk of choice as either APFS or HFS **(DO NOT USE ENCRYPTION. You will not be able to boot into the rest of the installation! You MAY be able to convert it later, but the EFI files provided will not allow you to boot an encrypted drive! I wasted 8 hours of my life before I figured this out, please don't do the same.)**
- Begin the installation as normal. Once the system reboots, boot back into the USB and select the drive you installed macOS on (not preboot as this may hang the system).
- Once the installation is fully complete, reboot back into the USB, boot into the Catalina installer on the USB again and run the macOS Post-Install Patch tool with it's default options. This is important to get 512+MB of VRAM on the HD 3000 (as oppose to 384MB) and to generally rebuild the kext cache, so don't skip this part even though you're so close to the desktop!
- Once the patcher is done, boot into macOS, install whatever patches the Patch Updater may ask you to.
- Once you're booted into the macOS, go into the "Other" folder on your USB and install the HeliPort application to get Wi-Fi up and running.
- To finalize everything, run Clover Configurator, mount your macOS EFI partition with it and use the Clover Cloner function to clone the EFI partition of your USB to the EFI partition of your HDD. You should now be able to boot into a perfectly usable version of macOS directly from your HDD/SSD!

## Troubleshooting
- Vertical Lines Showing Up / Occasional Hangs: This is usually caused by either too little RAM or (slightly) faulty RAM. The latest versions of macOS don't handle RAM error correction as well as Sierra and prior, so if this happens it's most likely a RAM issue. I'd recommend starting with a minimum of 8GB of RAM for a stable experience. This problem appears to plague any device with an HD3000 and isn't just exclusive to Thinkpads.
- AirPort doesn't work: Replace the "itlwm" kext in your EFI/Clover with the "AirportItlwm.kext" file in the "Other" folder of the repo. Please note that this may noticeably tank your internet speeds, so I've set itlwm as the default to ensure stability/performance. **DO NOT USE BOTH DRIVERS AT ONCE. You'll probably crash your system.**
- To use the trackpoint middle click to scroll, you'll want an app such as Smart Scroll. If you know a working free (or better yet, FOSS) alternative, please let me know, as Smart Scroll requires a paid license after a limited time trial.

## TODO:
- Move from Clover to OpenCore (I would absolutely love help with this to futureproof easily running macOS on the 220 series and keep these machines alive!).
- Possibly create an alternate config.plist to disable touchscreens on the X220T if you're like me and have a shattered digitizer. If you have any knowledge as to how to disable a single USB port / hub on macOS (ideally using Clover), please let me know!
- Figure out if it's safe on the X220 to raise the macOS VRAM amount from 512MB to 1GB for faster video acceleration, as there are plenty of guides on how to do it for official Macbooks of the same specs (useful for things like video/photo editing, not so useful for gaming! The main caveat being of course that's 512MB less RAM for the system to use.)

## Resources:
- dosdude1's Catalina patcher: http://dosdude1.com/catalina/
- x-t's repository: https://github.com/x-t/x220-catalina-efi


## Credits:
- x-t for the initial X220 Catalina repository that this is based off of.
- dosdude1 for creating macOS patching tools to allow older hardware to run newer oeprating systems 
- More to be added!

The cyberpunk in me gives endless thanks to everyone who helped make this possible. Your contributions to the Hackintosh and Thinkpad modification scenes will keep this machines alive for a good few years still. DIY or die!
