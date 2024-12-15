import 'package:flutter/material.dart';

class CustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonExist;
  final Function? onBackPressed;
  final bool showCart;
  final Color? bgColor;
  final Function(String value)? onVegFilterTap;
  final String? type;
  final List<Widget>? actions;
  const CustomAppbarWidget({
    super.key,
    required this.title,
    this.isBackButtonExist = true,
    this.onBackPressed,
    this.showCart = false,
    this.bgColor,
    this.onVegFilterTap,
    this.type,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: TextStyle(
              fontSize: 16,
              color: bgColor == null
                  ? Theme.of(context).textTheme.bodyLarge!.color
                  : Theme.of(context).cardColor)),
      centerTitle: true,
      backgroundColor: bgColor ?? Theme.of(context).cardColor,
      elevation: 0,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size(120, 50);
}
