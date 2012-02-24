if [ -d "temp" ] ; then
	rm -r temp
fi
mkdir temp
cp -r NEO/* temp/.
cd temp
find -name '.gitignore' -exec rm {} \;
find . | cpio -o -H newc | lzo > ../ramdisk.cpio.lzo
cd ..
rm -r temp
echo "Created."
