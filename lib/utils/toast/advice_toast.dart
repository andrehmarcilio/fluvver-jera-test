import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdviceToast {
  static show(BuildContext context, String message) {
    final ftoast = FToast();
    ftoast.init(context);
    ftoast.showToast(child: getToastWidget(message));
  }
}

Widget getToastWidget(String message) => Container(
      margin: const EdgeInsets.only(bottom: 40),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.info_outline),
          const SizedBox(
            width: 12.0,
          ),
          FittedBox(child: Text(message)),
        ],
      ),
    );
