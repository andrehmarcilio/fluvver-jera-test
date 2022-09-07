import 'dart:async';

import 'package:flutter/material.dart';

class CustomAutoComplete extends StatelessWidget {
  const CustomAutoComplete({Key? key, required this.label, required this.optionsBuilder, required this.onSelected}) : super(key: key);
  final String label;
  final FutureOr<Iterable<String>> Function(TextEditingValue) optionsBuilder;
  final Function(String) onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Autocomplete<String>(
        optionsBuilder: optionsBuilder,
        onSelected: onSelected,
        fieldViewBuilder: (context, controller, focusNode, onSubmit) {
          return  TextField(
            focusNode: focusNode,
            decoration:  InputDecoration(
              prefixIcon:  const Icon(Icons.search),
              label: Text(label),
            ),
            controller: controller,
          );
        },
      ),
    );
  }
}
