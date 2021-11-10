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

Further details can be found:
* Infineon [TPM 2.0 Application Note](https://www.infineon.com/dgdl/Infineon-App-Note-SLx9670-TPM2.0_Embedded_RPi_DI_SLx-AN-v01_20-EN.pdf?fileId=5546d46267c74c9a01684b96e69f5d7b)
* [AWS IoT Greengrass Hardware Security Integration Readme](https://github.com/StMaHa/amazon-greengrass-hsi-optiga-tpm/blob/master/README.md)
* All readme's related to the repositories used here

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

## Minimum setup
```
$ cd tpm2-software    
$ ./setup-tss.sh
$ ./setup-tpm2-tools.sh
```

## Setup all
(not tested yet)
```
$ cd tpm2-software    
$ ./setup.sh
```

## Testing
FAPI:
```
$ cd tpm2-software    
$ tss2_provision
$ tss2_getrandom --numBytes=20 -data=- | hexdump -C
```

ESAPI:
```
$ cd tpm2-software    
$ tpm2_getrandom 20 | hexdump -C
```


# LICENSE
See the [LICENSE](LICENSE) file for license rights and limitations.

---
<sup>(c) Raspberry Pi is a trademark of the Raspberry Pi Foundation.</sup>
