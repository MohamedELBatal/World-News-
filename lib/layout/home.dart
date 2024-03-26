import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/data_tab.dart';
import 'package:news_app/screens/drawer_tab.dart';
import 'package:news_app/screens/widgets/categories_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearching = false;

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
        drawer:  DrawerTab(onClick:  onDrawerClicked),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          title: _isSearching ? buildSearchField() : Text(
            categoryModel == null ? "News" : categoryModel!.title,
            style: const TextStyle(
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

        body: categoryModel == null
            ? CategoriesTab(
          onClick: onCategoryClicked,
        )
            : DataTab(categoryID: categoryModel!.id,
        ),
      ),
    );
  }

  CategoryModel? categoryModel;

  onCategoryClicked(catModel) {
    categoryModel = catModel;
    setState(() {

    });
  }
  onDrawerClicked(val){
    if(val == DrawerTab.CategoryID){
      categoryModel = null ;
      Navigator.pop(context);
      setState(() {

      });
    }else if(val == DrawerTab.SettingsID){
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
          icon: const Icon(Icons.search_outlined,size: 30,),
          onPressed: () {
            setState(() {
              _isSearching = true;
            });
          },
        ),
      ];
    }
  }
  buildSearchField() {
    return TextFormField(
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
        filled:true ,
        fillColor: Colors.white,
        hintText: 'Search Article',
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 10)),
        hintStyle: TextStyle(color: Colors.black),
      ),
      style: const TextStyle(color: Colors.black, fontSize: 16.0),
      onChanged: (value) {
      },
    );
  }
}