import 'package:flutter/material.dart';
import 'package:narpion_app/shared/appColor.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color textColor;
  final double verticalPadding;
  final double borderRadius;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor = Colors.white,
    this.verticalPadding = 12,
    this.borderRadius = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor ?? Theme.of(context).primaryColor,
    elevation: 0, // 🔥 removes shadow
    padding: EdgeInsets.symmetric(vertical: verticalPadding),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    ),
  ),
  onPressed: onPressed,
  child: Text(
    text,
    style: TextStyle(color: textColor, fontSize: 16 , fontWeight: FontWeight.w600),
  ),
);

  }
}
