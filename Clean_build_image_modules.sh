echo "Working.."

rm -r ./kernel_output/wiko/symbols/
rm -r ./kernel_output/wiko/system/lib/
rm ./kernel_output/wiko/boot.img
rm ./kernel_output/wiko/zImage_p

./mediatek/build/tools/mkimage arch/arm/boot/zImage KERNEL > ./kernel_output/wiko/zImage_p

make TARGET_PRODUCT=wiko TARGET_BUILD_VARIANT=user INSTALL_MOD_STRIP=1 INSTALL_MOD_PATH=./kernel_output/wiko/system INSTALL_MOD_DIR=./kernel_output/wiko/system android_modules_install

# Assuming https://github.com/bgcngm/mtk-tools is in the same directory as this folder
cd ../mtk-tools
./repack-MT65xx.pl -boot ../NeoKernel-MT6589-A116/kernel_output/wiko/zImage_p boot.img-ramdisk ../NeoKernel-MT6589-A116/kernel_output/wiko/boot.img

cd ../NeoKernel-MT6589-A116/
echo "Done."

