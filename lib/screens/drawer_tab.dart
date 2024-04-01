import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            child:  Center(
                child: Text(
              "News App!",
              style: GoogleFonts.poppins(fontSize: 35, color: Colors.white),
            )),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              onClick(CategoryID);
            },
            child:  Row(
              children: [
                const Icon(Icons.category_outlined),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Categories",
                  style: GoogleFonts.poppins(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w500),
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
            child:  Row(
              children: [
                const Icon(Icons.settings),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Settings",
                  style: GoogleFonts.poppins(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
