import 'dart:io';

class AdHelper {
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-2761501950649437/7147684040"; //Production
      //return "ca-app-pub-3940256099942544/1033173712"; //test
    } else if (Platform.isIOS) {
      return "ca-app-pub-2761501950649437/7147684040"; //Production
      // return "ca-app-pub-3940256099942544/4411468910"; //test
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
