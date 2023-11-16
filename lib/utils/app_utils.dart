import 'dart:io';

class AppUtils {
  static isMobile() {
    bool isMobile = false;
    try {
      isMobile = Platform.isAndroid || Platform.isIOS;
    } catch (e) {
      isMobile = false;
    }
    return isMobile;
  }
}
