import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.leftPadding = 16,
    this.rightPadding = 16,
    this.icon, this.onTap, this.focusNode, this.erro
  }) : super(key: key);
  final TextEditingController controller;
  final String label;
  final double leftPadding;
  final double rightPadding;
  final Widget? icon;
  final Function()? onTap;
  final FocusNode? focusNode;
  final String? erro;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        onTap: onTap,
        decoration: InputDecoration(
            prefixIcon: icon,
            errorText: erro,
            label: Text(label)),
      ),
    );
  }
}
