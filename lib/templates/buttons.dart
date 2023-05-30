import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double borderRadius;
  final Color? backgroundColor;
  final bool isTransparent;

  const RoundButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius = 10,
    this.isTransparent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: isTransparent ? Colors.transparent : null,
          backgroundColor: isTransparent ? Colors.transparent : backgroundColor,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
