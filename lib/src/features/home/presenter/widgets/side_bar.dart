import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  Widget _listTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: Colors.grey,
        size: 18,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.5,
      child: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: Image.asset(
              'assets/images/icons/app_icon.png',
              height: 50,
            ),
          ),
          _listTile(
            icon: Icons.gamepad,
            title: tr('home.yourGames'),
            onTap: () {},
          ),
          _listTile(
            icon: Icons.shop_2,
            title: tr('home.challenges'),
            onTap: () {},
          ),
          _listTile(
            icon: Icons.notifications,
            title: tr('home.notifications'),
            onTap: () {},
          ),
          _listTile(
            icon: Icons.person,
            title: tr('home.profile'),
            onTap: () {},
          ),
          _listTile(
            icon: Icons.open_in_browser,
            title: tr('home.invite'),
            onTap: () {},
          ),
          _listTile(
            icon: Icons.help,
            title: tr('home.help'),
            onTap: () {},
          ),
          _listTile(
            icon: Icons.settings,
            title: tr('home.settings'),
            onTap: () {},
          ),
          _listTile(
            icon: Icons.info,
            title: tr('home.about'),
            onTap: () {},
          ),
          _listTile(
            icon: Icons.logout,
            title: tr('home.logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
