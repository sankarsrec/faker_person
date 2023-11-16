import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/app_colors.dart';

class CustomToast {
  static show({
    required String message,
    String description = '',
    bool isError = false,
  }) {
    Fluttertoast.showToast(
      msg: '$message${description.isNotEmpty ? '\n' : ''}$description',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: isError ? AppColors.red : AppColors.green,
      textColor: AppColors.white,
      fontSize: 16.0,
    );
  }
}
