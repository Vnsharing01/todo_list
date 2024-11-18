import 'package:flutter/material.dart';

class DefaulAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaulAppBar({
    super.key,
    required this.title,
    this.centerTitle,
    this.actions,
    this.isShowLeading, this.leading,
  });

  final String title;

  final bool? centerTitle;
  final bool? isShowLeading;

  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
      centerTitle: centerTitle ?? true,
      actions: actions,
      automaticallyImplyLeading: isShowLeading ?? true,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
