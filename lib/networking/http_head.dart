import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

import 'global.dart';

/// 参考必要app的head
class HttpHead {
  late String contentType;
  late String deviceType;
  late String systemVersion;
  late String channel;
  late String payplatform;
  late String uuid;
  late String appVersion;
  late String numVersion;
  late String appName;
  late String platform;
  late String sessionId;
  late String isOpenAddressBookAuth;
  late String pushId;
  late String hand2;
  late Map<String, String> headerValue;

  /// 单例对象
  static final HttpHead _instance = HttpHead._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory HttpHead.getInstance() => _instance;
  //
  HttpHead._internal() {
    headerValue = {};
    contentType = 'application/x-www-form-urlencoded';
    channel = Global.channel;
    payplatform = Global.payplatform;
    isOpenAddressBookAuth = Global.isOpenAddressBookAuth;
    pushId = '0';
    numVersion = Global.numVersion;
    appName = Global.appName;
    appVersion = Global.appVersion;
    sessionId = 'dcb01e2c525df350eb5f41f33d1088ba';
    hand2 = 'b6854437b6aa30ef6402e3e424348dec';
    uuid = '722033011133568a362296dd6fa400000000';
    initHead();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    var deviceData = <String, dynamic>{};
    try {
      if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        headerValue['deviceType'] = deviceData['name'];
        headerValue['systemVersion'] = deviceData['systemVersion'];
        headerValue['platform'] = 'iOS';
      } else if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        headerValue['platform'] = 'andorid';
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }
  }

  void initHead() {
    Map<String, String> heads = {
      'content-type': contentType,
      'channel': channel,
      'payplatform': payplatform,
      'uuid': uuid,
      'appVersion': appVersion,
      'isOpenAddressBookAuth': isOpenAddressBookAuth,
      'pushId': pushId,
      'numVersion': numVersion,
      'appName': appName,
      'sessionId': sessionId,
      'hand2': hand2
    };
    headerValue.addAll(heads);
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }
}
