import 'package:flutter/material.dart';

class CustomItemCheckBox extends StatelessWidget {
  const CustomItemCheckBox(
      {Key? key,
      required this.selectedValue,
      required this.value,
      required this.onChanged,
      required this.imagePath,
      required this.name,
      this.subTitulo})
      : super(key: key);
  final dynamic selectedValue;
  final dynamic value;
  final String imagePath;
  final String name;
  final String? subTitulo;
  final Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  imagePath,
                  width: 32,
                  height: 32,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                    subTitulo == null ? const SizedBox.shrink() :
                    Text(
                      subTitulo!,
                      style: const TextStyle(
                        fontSize: 12, color: Color.fromRGBO(34, 34, 34, 0.32)),)
                  ],
                )
              ],
            ),
            Radio(
                groupValue: selectedValue,
                value: value,
                onChanged: onChanged,
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return const Color(0xff24B96E);
                  } else {
                    return const Color(0xff222222);
                  }
                })),
          ],
        ),
      ),
    );
  }
}
