import 'package:flutter/material.dart';

class StaticBottomSheet extends StatelessWidget {
  final double height;
  final double topPadding;
  final Widget? child;

  const StaticBottomSheet({
    super.key,
    required this.height,
    this.child,
    this.topPadding = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10,
              blurStyle: BlurStyle.outer,
              offset: Offset(0, -1),
            ),
          ]
        ),
        width: double.infinity,
        height: height,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: topPadding),
          child: child,
        ),
      ),
    );
  }
}
