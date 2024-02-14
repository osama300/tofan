import 'dart:io';

class Functions {
  bool openOnBoarding() {
    return false;
  }

  void setThemeApp() {}

  String getPlatformApp() {
    if (Platform.isAndroid) {
      return "android";
    } else {
      return "ios";
    }
  }
}
