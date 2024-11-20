import 'package:flutter/material.dart';
import 'package:transcriptapp/src/features/auth/presenter/widgets/user_avatar.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.grey, size: 28),
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, color: Colors.grey),
      ),
      actions: const [UserAvatarWidget()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
