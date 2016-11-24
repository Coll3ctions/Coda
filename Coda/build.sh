#!/bin/sh

buildPath=""
buildOption=""
if [ "$1" = "-d" ]; then
	buildPath="../Coda-debug-build"
	buildOption="Debug"
elif [ "$1" = "-r" ]; then
	buildPath="../Coda-release-build"
	buildOption="Release"
else
	buildPath="../Coda-build"
	buildOption="Default"
fi

if [ -d "$buildPath" ]; then
	echo 'path exists...'
else
	echo "path doesn't exist...creating..."
	mkdir $buildPath
fi

cd $buildPath
cmake -DCMAKE_BUILD_TYPE:STRING="$buildOption" -G "Eclipse CDT4 - Unix Makefiles" ../Coda
make -j

