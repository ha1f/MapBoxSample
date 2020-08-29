# MapBoxSample

# Getting started

### Environment

Xcode 11.5
[Carthage](https://github.com/Carthage/Carthage) 0.35.0

### Set up environment

MapBox SDKをdownloadするためのsecret tokenを発行する必要がある。
Download `Downloads:Read` にチェック入れるのを忘れずに発行し、指示通り `.netrc` ファイルをホームに配置する
ref: https://docs.mapbox.com/ios/maps/overview/#install-the-maps-sdk

### install

`./script/install` で依存ライブラリがインストールされる。
MapBox系のエラーは公式がかなり網羅していそう→[Troubleshooting Mapbox Maps SDK for iOS installation](https://docs.mapbox.com/help/troubleshooting/ios-sdk-installation/)

### Run

Info.plistに `MGLMapboxAccessToken` としてtokenを追加する必要がある。

ref: https://docs.mapbox.com/ios/maps/overview/#install-the-maps-sdk
