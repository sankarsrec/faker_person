import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: AppColors.transparent,
      shadowColor: AppColors.transparent,
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Center(
          child: CupertinoActivityIndicator(
            radius: 20,
            animating: true,
          ),
        ),
      ),
    );
  }
}
