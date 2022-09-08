import 'package:flutter/material.dart';

import 'home_bottom_nav_item.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Color(0x22222214),
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 5.0,
            ),
          ]
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            HomeNavItem(iconData: Icons.home, label: "Início"),
            HomeNavItem(iconData: Icons.notifications, label: "Notificações"),
            HomeNavItem(iconData: Icons.chat_bubble, label: "Chat"),
            HomeNavItem(iconData: Icons.layers, label: "Pedidos"),
            HomeNavItem(iconData: Icons.local_shipping, label: "Entregas")
          ],
        ),
      ),
    );
  }
}
