import 'package:auto_nanny/templates/texts.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? toolbarHeight;
  final bool isTransparent;
  final double screenHeight;
  final BuildContext context;
  final List<Widget>? actions;

  const CustomAppBar(
    this.context,
    this.screenHeight,
    {
      super.key,
      this.toolbarHeight,
      this.isTransparent = true,
      this.actions,
    }
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolbarHeight,
      elevation: isTransparent ? 0 : 10,
      backgroundColor: isTransparent ? Colors.transparent : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
      ),
      leading: IconButton(
        splashRadius: 25,
        icon: Icon(
          Icons.arrow_back,
          color: Colors.grey[800],
        ),

        onPressed: () => Navigator.pop(this.context),
      ),
      actions: actions,
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(screenHeight * .1);
}
