import 'package:flutter/material.dart';

class HomeNavItem extends StatelessWidget {
  const HomeNavItem({Key? key, required this.iconData, required this.label})
      : super(key: key);
  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: const Color(0xFFB8B8B8),
          size: 25,
        ),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(
                color: Color(0xFFB8B8B8), fontSize: 10, letterSpacing: 0))
      ],
    );
  }
}
