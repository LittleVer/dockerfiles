FROM limaofeng/gradle-alpine
MAINTAINER limaofeng <limaofeng@msn.com>

# 安装 android 环境
RUN cd /usr/lib/ && \
    set -x && \
    apk add --no-cache wget && \
    wget --quiet --output-document=android-sdk.tgz https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && \
    tar --extract --gzip --file=android-sdk.tgz && \
    echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter android-23 && \
    echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter platform-tools && \
    echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter build-tools-23.0.3 && \
    echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-android-m2repository && \
    echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-google_play_services && \
    echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-m2repository && \
    export ANDROID_HOME=$PWD/android-sdk-linux && \
    rm android-sdk.tgz && \
    mkdir ~/.gradle/ && \
    mkdir ~/.gradle/distribution && \
    cd ~/.gradle/distribution && \
    wget --quiet --output-document=gradle-2.13-all.zip https://services.gradle.org/distributions/gradle-2.13-all.zip && \
    apk del wget
