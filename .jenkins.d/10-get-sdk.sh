#!/usr/bin/env bash
set -e
set -x

SDK_TOOLS_VERSION=24.0.2
BUILD_TOOLS_VERSION=21.1.2
COMPILE_SDK_VERSION=21

export ANDROID_HOME=`pwd`/android-sdk-linux
export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
export PATH=$PATH:`pwd`/gradle-2.2.1/bin

if [ ! -d android-sdk-linux ]; then
    wget -q http://dl.google.com/android/android-sdk_r24.0.2-linux.tgz
    tar zxf android-sdk_r24.0.2-linux.tgz
    rm android-sdk_r24.0.2-linux.tgz

    echo "y" | android update sdk --filter platform-tools,build-tools-$BUILD_TOOLS_VERSION,android-$COMPILE_SDK_VERSION,extra-android-support,extra-android-m2repository,extra-google-m2repository --no-ui --all --force
    echo "y" | android update sdk --filter "android-19" --no-ui --all --force
fi

wget -q https://services.gradle.org/distributions/gradle-2.2.1-bin.zip
unzip gradle-2.2.1-bin.zip
rm gradle-2.2.1-bin.zip

echo sdk.dir=`pwd`/android-sdk-linux >> local.properties
