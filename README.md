# Lain's X220 macOS Catalina Repository
A repository of information and kexts for running macOS Mojave on the Thinkpad X220 (and T420/T520/L420/L520) series of laptops. Largely based off of x-t's x220-catalina-efi repository, but hopefully with a few quality of life adjustments to help the X220 work as a stable daily driver, ideally without external hardware modifications. Please feel free to make your own forks of this repository to help keep the 220 series a solid choice for a Hackintosh laptop!

*Please be respectful of the fact that I may not be able to provide too much support for this. I'll update it regularly as new discoveries and modifications are made, but I very frequently take breaks from GitHub due to health issues and cannot be relied on for tech support. Consider this repo a starting point more than a finished product until stated otherwise. Thank you and stay safe!*

![Screenshot from my trusty X220 running Catalina!](x220catalina.png)

If you would like to donate so I can test out additional Thinkpad hardware (including repairing my X1C1 to further optimize macOS potential), my PayPal is [here!](https://www.paypal.com/donate/?cmd=_s-xclick&hosted_button_id=8GF4A3XS7ZHFY) 

## Lain's X220T Specs:
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
- Bluetooth (Not sure why, any advice on this matter would be appreciated! Probably just missing a kext or two. Using BrcmPatchRAM3 and it's additional kexts doesn't seem to change anything, but YMMV.)
- Encrypted Partitions: I don't know if my macOS USB is just faulty or what, but during my initial installations neither APFS Encrypted nor HFS encrypted would allow me to finish the installation. This may just be an oversight on my end, but don't try to encrypt your drive if you're not prepared to troubleshoot (using -v in Clover didn't provide me too much human-readable 
- The touchpad settings screen is just blank, so you can't modify any options. This is due to the modified VoodooPS2Controller kext designed specifically for the X220 touchpad. Usually the solution to this issue would be replacing the kext with an official version, but the official version doesn't work well with the X220 touchpad (jumpy/erratic behaviour when clicking/scrolling, unbearably slow trackpoint speed etc.)
- X220T-specific: Tablet Screen Buttons (Only Power works, I know there's definietly a way to remap the other buttons, as I did in macOS Sierra years ago, but I've forgotten how, haha.)

## Untested:
- Facetime / iMessage / etc. (If you want to get it working, you'll need to generate a new serial key using something such as osx-serial-generator and look up a seperate guide to get these things working on a Catalina Hackintosh. I don't use these features so I can't provide support at the moment.)
- Mini-Displayport output
- Bluetooth Hand-Off (due to no Bluetooth support at the moment.)
- Airport (read under troubleshooting to give it a shot!)
- ExpressCard (I don't have the monetary resources to acquire any ExpressCard devices to test, if you'd like to donate $20 to order one for testing check the link above!)
- Compatibility with modifications such as Coreboot, USB-C charging (should be fine as it theoretically doesn't change how the software interfaces w/ the charger but YMMV), screen mods, etc. Such modifications may require additional DDST/SDST patching.
- Lots of other things, I'm sure. 

# TL;DR Installation Guide (there are more concrete guides online, but this is a short step-by-step that assumes you have at least a fledgling amount of Hackintosh literacy.)

*Please note that you take full responsibility for any potential hardware damage, data loss, house fires, nuclear wars, etc. that following any of the steps in this guide may cause. I've written these steps out in laymens terms, but if there's any doubt in your mind about a step, please consult Google.* 

- Using a MacOS device/VM (or Windows/Linux, but support will not be provided for that here but a quick Google search will provide tons of resources), use dosdude1's Catalina patcher to create a bootable 16+GB USB device. It's essential to use this patcher to ensure that all of the hardware functions properly, and you may not be able to successfully boot without using it. 
- Once the device has been created, go to the EFI partition of the USB device and replace the contents with the EFI folder of this repository.
- Boot into macOS, go to Disk Utility, then format your disk of choice as either APFS or HFS **(DO NOT USE ENCRYPTION. You will not be able to boot into the rest of the installation! You MAY be able to convert it later, but the EFI files provided will not allow you to boot an encrypted drive! I wasted 8 hours of my life before I figured this out, please don't do the same.)**
- Begin the installation as normal. Once the system reboots, boot back into the USB and select the drive you installed macOS on (not preboot as this may hang the system).
- Once the installation is fully complete, reboot back into the USB, boot into the Catalina installer on the USB again and run the macOS Post-Install Patch tool with it's default options. This is important to get 512+MB of VRAM on the HD 3000 (as oppose to 384MB) and to generally rebuild the kext cache, so don't skip this part even though you're so close to the desktop!
- Once the patcher is done, boot into macOS, install whatever patches the Patch Updater may ask you to.
- Once you're booted into the macOS, go into the "Other" folder on your USB and install the HeliPort application to get Wi-Fi up and running.
- To finalize everything, run Clover Configurator, mount your macOS EFI partition with it and use the Clover Cloner function to clone the EFI partition of your USB to the EFI partition of your HDD. You should now be able to boot into a perfectly usable version of macOS directly from your HDD/SSD!
- *Optional for users with 8+GB of RAM:* Use the Legacy Video Patcher by ipang-wi (included in the Other folder) to patch your HD 3000 from 512MB of VRAM to 2GB of VRAM. This can help increase performance and stability in some cases. 

## Troubleshooting
- Vertical Lines Showing Up / Occasional Hangs: This is usually caused by either too little RAM or (slightly) faulty RAM. The latest versions of macOS don't handle RAM error correction as well as Sierra and prior. I'd recommend starting with a minimum of 8GB of RAM for a stable experience. This problem appears to plague any device with an HD3000 and isn't just exclusive to Thinkpads. If the issue continues with 8+GB of RAM, try swapping RAM slots and/or running the Legacy Video Patcher included in the "Other" folder, which will patch your HD 3000 to use 2GB of VRAM instead of 512MB which has been reported to help stability. 
- AirPort doesn't work: Replace the "itlwm" kext in your EFI/Clover with the "AirportItlwm.kext" file in the "Other" folder of the repo. Please note that this may noticeably tank your internet speeds, so I've set itlwm as the default to ensure stability/performance. **DO NOT USE BOTH DRIVERS AT ONCE. You'll probably crash your system.**
- To use the trackpoint middle click to scroll, you'll want an app such as Smart Scroll. If you know a working free (or better yet, FOSS) alternative, please let me know, as Smart Scroll requires a paid license after a limited time trial.

## TODO:
- Move from Clover to OpenCore (I would absolutely love help with this to futureproof easily running macOS on the 220 series and keep these machines alive!).
- Possibly create an alternate config.plist to disable touchscreens on the X220T if you're like me and have a shattered digitizer. If you have any knowledge as to how to disable a single USB port / hub on macOS (ideally using Clover), please let me know!
- Figure out if it's safe on the X220 to raise the macOS VRAM amount from 512MB to 1GB for faster video acceleration, as there are plenty of guides on how to do it for official Macbooks of the same specs (useful for things like video/photo editing, not so useful for gaming! The main caveat being of course that's 512MB less RAM for the system to use.)
- See if this setup works on macOS Big Sur or not (it probably won't, and I won't try any time soon due to hearing that Sur is unstable even on real hardware, but if anyone wants to give it a shot using BenSova's Big Sur patcher instead of dosdude1's Catalina patcher please report back!)

## Resources:
- dosdude1's Catalina patcher: http://dosdude1.com/catalina/
- x-t's repository: https://github.com/x-t/x220-catalina-efi


## Credits:
- x-t for the initial X220 Catalina repository that this is based off of.
- dosdude1 for creating macOS patching tools to allow older hardware to run newer oeprating systems 
- More to be added!

The cyberpunk in me gives endless thanks to everyone who helped make this possible. Your contributions to the Hackintosh and Thinkpad modification scenes will keep this machines alive for a good few years still. DIY or die!
