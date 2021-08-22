import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class SharedProvider extends ChangeNotifier {
  bool _isAppInitiated = false;
  // Device Info
  String _deviceModel;
  String _deviceID;
  String _deviceOS;
  String _deviceOSVersion;

  get isAppInitiated => _isAppInitiated;
  set isAppInitiated(bool newValue) {
    _isAppInitiated = newValue;
    notifyListeners();
  }

  get deviceModel => _deviceModel;
  get deviceID => _deviceID;
  get deviceOSVersion => _deviceOSVersion;

  Future<void> getDeviceDetails() async {
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();

    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      _deviceModel = build.model;
      _deviceID = build.androidId;
      _deviceOSVersion = build.version.release;

      print('');
      print('***DEVICE INFO***');
      print('OS: Android');
      print('model: ${build.model}');
      print('isPhysicalDevice: ${build.isPhysicalDevice}');
      print('type: ${build.type}');
      print('id: ${build.id}');
      print('androidId: ${build.androidId}');
      print('supported64BitAbis: ${build.supported64BitAbis}');
      print('supported32BitAbis: ${build.supported32BitAbis}');
      print('supportedAbis: ${build.supportedAbis}');
      print('version-release: ${build.version.release}');
      print('version-baseOS: ${build.version.baseOS}');
      print('version-codename: ${build.version.codename}');
      print('version-incremental: ${build.version.incremental}');
      print('version-previewSdkInt: ${build.version.previewSdkInt}');
      print('version-sdkInt: ${build.version.sdkInt}');
      print('version-securityPatch: ${build.version.securityPatch}');
      print('fingerprint: ${build.fingerprint}');
      print('board: ${build.board}');
      print('bootloader: ${build.bootloader}');
      print('brand: ${build.brand}');
      print('device: ${build.device}');
      print('display: ${build.display}');
      print('host: ${build.host}');
      print('manufacturer: ${build.manufacturer}');
      print('hardware: ${build.hardware}');
      print('product: ${build.product}');
      print('systemFeatures: ${build.systemFeatures}');
      print('tags: ${build.tags}');
      print('*****************');
      print('');
    } else if (Platform.isIOS) {
      var data = await deviceInfoPlugin.iosInfo;
      _deviceModel = data.model;
      _deviceID = data.identifierForVendor;
      _deviceOSVersion = data.systemVersion;

      print('');
      print('***DEVICE INFO***');
      print('OS: iOS');
      print('identifierForVendor: ${data.identifierForVendor}');
      print('systemVersion: ${data.systemVersion}');
      print('isPhysicalDevice: ${data.isPhysicalDevice}');
      print('model: ${data.model}');
      print('name: ${data.name}');
      print('localizedModel: ${data.localizedModel}');
      print('systemName: ${data.systemName}');
      print('utsname-version: ${data.utsname.version}');
      print('utsname-release: ${data.utsname.release}');
      print('utsname-machine: ${data.utsname.machine}');
      print('utsname-nodename: ${data.utsname.nodename}');
      print('utsname-sysname: ${data.utsname.sysname}');
      print('*****************');
      print('');
    }
  }
}
