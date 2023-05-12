# Device tree overlays
### tpm-slb9673.dts: Infineon I2C TPM
Build device tree overlay:
```
$ dtc -O dtb -o tpm-slb9673.dtbo tpm-slb9673-overlay.dts
$ sudo cp tpm-slb9673.dtbo /boot/overlays/
```
Device tree does not define the baudrate.  
By default the Raspberry  Pi runs I2C with 100KHz.  

To set a different baudrate.  
Add the following line to /boot/config.txt:
```
dtparam=i2c_arm_baudrate=400000
```
To get the actual I2C baudrate run...
```
$ sudo echo "ibase=16; $(xxd -ps -u /sys/class/i2c-adapter/i2c-1/of_node/clock-frequency)" | bc
```
```
$ 400000
```
