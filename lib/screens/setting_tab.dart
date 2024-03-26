import 'package:flutter/material.dart';

class SettingTab extends StatelessWidget {
  SettingTab({super.key});

  static int CategoryID = 1;
  static int SettingsID = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Language",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 30,
        ),
        TextFormField(
          decoration: InputDecoration(
            label: const Text("English"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.green, width: 5),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 5),
            ),
          ),
        ),
      ],
    );
  }
}
