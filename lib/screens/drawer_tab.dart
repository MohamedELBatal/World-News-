import 'package:flutter/material.dart';

class DrawerTab extends StatelessWidget {
  Function onClick;

  DrawerTab({required this.onClick, super.key});

  static int CategoryID = 1;
  static int SettingsID = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * .75,
      child: Column(
        children: [
          Container(
            height: 160,
            color: Colors.green,
            child: const Center(
                child: Text(
              "News App",
              style: TextStyle(fontSize: 35, color: Colors.white),
            )),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              onClick(CategoryID);
            },
            child: const Row(
              children: [
                Icon(Icons.category_outlined),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              onClick(SettingsID);
            },
            child: const Row(
              children: [
                Icon(Icons.settings),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
