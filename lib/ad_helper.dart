import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7443083882734789/2695314746";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
