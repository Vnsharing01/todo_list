import 'package:flutter/material.dart';

import '../styles/this_colos.dart';

class ButtonTextView extends StatelessWidget {
  const ButtonTextView({
    super.key,
    required this.btnName,
    this.background,
    this.onTap,
    this.borderRadius,
    this.textColor,
  });

  final String btnName;
  final Color? background, textColor;
  final void Function()? onTap;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        color: background ?? ThisColors.mainColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          child: Container(
            height: 48,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            alignment: Alignment.center,
            child: Text(
              btnName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor ?? Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
