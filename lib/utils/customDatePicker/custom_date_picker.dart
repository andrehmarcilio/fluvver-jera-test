import 'package:flutter/material.dart';
import 'package:muvver_jera_teste/utils/extensions/date_time_extensions.dart';

class CustomDatePicker {
  static Future<String?> show(BuildContext context) async {
    final dateTimeResult = await showDatePicker(context: context,
        locale: const Locale('pt', 'BR'),
        initialDate: DateTime.now(),
        firstDate:  DateTime.now(),
        lastDate:  DateTime.now().add(const Duration(days: 60)));
    if(dateTimeResult != null) {
        return dateTimeResult.formatBr();
    }
    return null;
  }
}