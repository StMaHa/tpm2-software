# tpm2-software
Linux TPM2 &amp; TSS2 Software

> Scripts and examples from this repository...  
> ...related to repository https://github.com/tpm2-software  
> ...show how to install and use TPM (e.g. on Raspberry Pi) with TPM2 Software Stack  
> ...intended to be used on **Raspberry Pi**.  
> ...tested on Raspberry Pi 4B with Raspberry Pi OS based on Buster.  
>
> ...tested with add-on boards for Raspberry Pi:
> - IRIDIUM SLM9670 TPM2.0 (purchasable at mouser.com)  
> - LetsTrust TPM SLB9670 (purchasable at buyzero.de)  

## Prepare for setup
**Update your system:**
```
$ sudo apt update
$ sudo apt -y full-upgrade
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

**Enable SPI on Raspberry Pi**

**Enable TPM support on Raspberry Pi**

## Setup
```
$ cd tpm2-software
$ ./setup.sh
```
