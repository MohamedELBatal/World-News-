import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/widgets/category_item.dart';

class CategoriesTab extends StatelessWidget {
  Function onClick ;
   CategoriesTab({required this.onClick,super.key});

  @override
  Widget build(BuildContext context) {
    var categories = CategoryModel.getCategories();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
           Text(
            "Pick your category of interest",
            style: GoogleFonts.poppins(
              fontSize: 40,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onClick(categories[index]);
                    },
                    child: CategoryItem(model: categories[index], index: index,));
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
