#! /bin/sh
#
# Find out where we are and change to ARUnity5 root.
#
OURDIR=$(cd "$(dirname "$0")"; pwd)
cd "${OURDIR}/../../"
echo "Building archive from directory \"$PWD\"."

echo "Do you want to copy the utilities from ARToolKit5 folder? (y or n)"
echo -n "Enter : "
read ANS
if [ "$ANS" = "y" ]
then
COPYUTILS="y"
elif [ "$ANS" = "n" ]
then
COPYUTILS="n"
else
echo "Please enter y or n."
exit 0
fi

echo "Do you want to copy the utilities from WINDOWS ARToolKit5 folder? (y or n)"
echo -n "Enter : "
read ANS
if [ "$ANS" = "y" ]
then
COPYUTILSWIN="y"
elif [ "$ANS" = "n" ]
then
COPYUTILSWIN="n"
else
echo "Please enter y or n."
exit 0
fi

if [ "$COPYUTILS" = "y" ]
then
cp -vp \
    ../ARToolKit5/bin/calib_camera \
    ../ARToolKit5/bin/calib_optical \
    ../ARToolKit5/bin/calib_stereo \
    ../ARToolKit5/bin/check_id \
    ../ARToolKit5/bin/checkResolution \
    ../ARToolKit5/bin/dispFeatureSet \
    ../ARToolKit5/bin/dispImageSet \
    ../ARToolKit5/bin/genTexData \
    ../ARToolKit5/bin/genMarkerSet \
    ../ARToolKit5/bin/mk_patt \
    bin/
fi

if [ "$COPYUTILSWIN" = "y" ]
then
cp -vp \
    /Volumes/C/Projects/ARToolKit5/bin/ARvideo.dll \
    /Volumes/C/Projects/ARToolKit5/bin/calib_camera.exe \
    /Volumes/C/Projects/ARToolKit5/bin/calib_optical.exe \
    /Volumes/C/Projects/ARToolKit5/bin/calib_stereo.exe \
    /Volumes/C/Projects/ARToolKit5/bin/check_id.exe \
    /Volumes/C/Projects/ARToolKit5/bin/checkResolution.exe \
    /Volumes/C/Projects/ARToolKit5/bin/dispFeatureSet.exe \
    /Volumes/C/Projects/ARToolKit5/bin/dispImageSet.exe \
    /Volumes/C/Projects/ARToolKit5/bin/genMarkerSet.exe \
    /Volumes/C/Projects/ARToolKit5/bin/genTexData.exe \
    /Volumes/C/Projects/ARToolKit5/bin/mk_patt.exe \
    bin/
cp -vp \
    /Volumes/C/Projects/ARToolKit5/bin/ARvideo.dll \
    redist/
cp -vp \
    /Volumes/C/Projects/ARToolKit5/bin64/ARvideo.dll \
    redist64/
fi

#
# Give the archive a sensible name.
#
#OS=`uname -s`
OS="OSX"
ARCH=`uname -m`
VERSION=`sed -En -e 's/This archive contains the ARToolKit for Unity project, plugins, utilities and examples, version[[:space:]]+([0-9]+\.[0-9]+(\.[0-9]+)*).*/\1/p' ARToolKit\ for\ Unity\ Readme.txt`
#
# Build the archive.
# Exclude: build files and directories, version control info,
# ARToolKitNFTiOS settings files which don't carry over.
#
tar czvf "../ARUnity5-${VERSION}-${OS}.tar.gz" \
	-T share/packaging/ARUnity5-bin-bom \
	--exclude "*/.svn" \
	--exclude "*.o" \
	--exclude "Makefile" \
	--exclude "build" \
	--exclude "*.mode1*" \
	--exclude "*.pbxuser" \
	--exclude ".DS_Store" \
	--exclude "xcuserdata" \

