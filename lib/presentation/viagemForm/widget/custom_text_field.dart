import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.leftPadding = 16,
    this.rightPadding = 16,
    this.icon
  }) : super(key: key);
  final TextEditingController controller;
  final String label;
  final double leftPadding;
  final double rightPadding;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: icon,
            label: Text(label)),
      ),
    );
  }
}
