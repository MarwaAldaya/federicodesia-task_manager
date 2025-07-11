import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final bool isExpanded;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textStyle,
    this.buttonColor,
    this.borderRadius = 12,
    this.padding,
    this.width,
    this.height,
    this.isExpanded = false,
    this.icon,
    this.iconColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, color: iconColor ?? Colors.white, size: iconSize ?? 20),
          const SizedBox(width: 8),
        ],
        Text(
          text,
          style: textStyle ??
              TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );

    return SizedBox(
      width: isExpanded ? double.infinity : width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? Theme.of(context).primaryColor,
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: child,
      ),
    );
  }
}
