import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.buttonText,
    this.onPressed,
    this.color,
    this.minWidth,
    this.height,
    this.textColor,
    this.icon,
    this.padding,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback? onPressed;
  final Color? color;
  final double? minWidth;
  final double? height;
  final Color? textColor;
  final Widget? icon;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: TextButton(
        onPressed: onPressed != null
            ? () {
                FocusScope.of(context).unfocus();
                onPressed!();
              }
            : null,
        style: ElevatedButton.styleFrom(
          minimumSize: Size.zero,
          backgroundColor: color,
        ),
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: textColor ?? AppColors.primaryColor,
              ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ),
    );
  }
}
