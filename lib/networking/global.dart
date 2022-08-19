/// 全局配置
class Global {
  /// token
  static String accessToken = "";
  static bool retryEnable = true;
  static String channel = 'ios_biyao';
  static String payplatform = 'mobile';
  static String isOpenAddressBookAuth = '0';
  static String numVersion = '212';
  static String appName = 'biyao';
  static String appVersion = '5.79.0';

  /// 是否 release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");
}
