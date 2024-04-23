import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/data_tab.dart';
import 'package:news_app/screens/drawer_tab.dart';
import 'package:news_app/screens/setting_tab.dart';
import 'package:news_app/screens/widgets/categories_tab.dart';
import 'package:news_app/screens/widgets/custom_search_delegate.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearching = false;
  late Widget bodyContent = categoryModel == null
      ? CategoriesTab(
          onClick: onCategoryClicked,
        )
      : DataTab(categoryID: categoryModel!.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: DrawerTab(onClick: onDrawerClicked),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Text(
                  categoryModel == null ? "News" : categoryModel!.title,
                  style: GoogleFonts.exo(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
          backgroundColor: Colors.green,
          shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(18),
              bottomLeft: Radius.circular(18),
            ),
          ),
          actions: _buildActions(),
        ),
        body: bodyContent,
      ),
    );
  }

  CategoryModel? categoryModel;

  onCategoryClicked(catModel) {
    categoryModel = catModel;
    bodyContent = DataTab(categoryID: categoryModel!.id);
    setState(() {});
  }

  onDrawerClicked(val) {
    if (val == DrawerTab.CategoryID) {
      categoryModel = null;
      bodyContent = CategoriesTab(onClick: onCategoryClicked);
      Navigator.pop(context);
      setState(() {});
    } else if (val == DrawerTab.SettingsID) {
      bodyContent = SettingTab();
      Navigator.pop(context);
      setState(() {});
    }
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            setState(() {
              _isSearching = false;
            });
          },
        ),
      ];
    } else {
      return [
        IconButton(
          icon: const Icon(
            Icons.search_outlined,
            size: 30,
          ),
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearch(),
            );
          },
        ),
      ];
    }
  }

  buildSearchField() {
    return TextFormField(
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Search Article',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 10),
        ),
        hintStyle: TextStyle(color: Colors.white),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (value) {},
    );
  }
}
