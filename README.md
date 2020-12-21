**:construction: Under Construction :construction: Under Construction :construction: Under Construction :construction: Under Construction :construction:**
# tpm2-software
Linux TPM2 &amp; TSS2 Software

> Scripts and examples from this repository...  
> ...related to repository https://github.com/tpm2-software  
> ...show how to install and use TPM with TPM2 Software Stack  
>
> ...intended to be used on **Raspberry Pi**.  
> ...tested on Raspberry Pi 4B with Raspberry Pi OS based on Buster.  
>
> ...tested with add-on boards for Raspberry Pi:
> - IRIDIUM SLM9670 TPM2.0 (purchasable at mouser.com)  
> - LetsTrust TPM SLB9670 (purchasable at buyzero.de)  

## Prepare for setup
**Plug in a TPM add-on board**

**Update your system**  
```
$ sudo apt update
$ sudo apt -y full-upgrade
```

**Enable SPI interface on Raspberry Pi:**  
therefor edit the file: `/boot/config.txt`  
`$ sudo nano /boot/config.txt`  
and add `dtparam=spi=on` to file `config.txt`  
or  
do `$ sudo raspi-config`  

**Enable TPM support on Raspberry Pi:**  
therefor edit the file: `/boot/config.txt`  
`$ sudo nano /boot/config.txt`  
and add `dtoverlay=tpm-slb9670` to file `config.txt`

:fire: **After the above preparation steps reboot your Raspberry Pi  
and check:**  
```
$ ls /dev/tpm*  
/dev/tpm0  /dev/tpmrm0
``` 

**Download / clone the repository to your computer:**  
```
$ git clone https://github.com/StMaHa/tpm2-software.git
```

**To update already cloned repository, do the following steps:**  
```
$ cd tpm2-software
$ git fetch
$ git rebase
```

## Setup
```
$ cd tpm2-software    
$ ./setup.sh
```

# LICENSE
See the [LICENSE](LICENSE.md) file for license rights and limitations.

---
<sup>(c) Raspberry Pi is a trademark of the Raspberry Pi Foundation.</sup>
