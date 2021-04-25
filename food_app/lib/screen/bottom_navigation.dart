import 'package:flutter/material.dart';
import 'package:food_app/screen/category_screen.dart';
import 'package:food_app/screen/favorite_screen.dart';
import 'package:food_app/widget/main_drawer.dart';

class BottomTapScreen extends StatefulWidget {
  @override
  _BottomTapScreenState createState() => _BottomTapScreenState();
}

class _BottomTapScreenState extends State<BottomTapScreen> {
  int selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]["title"]),
      ),
      body: pages[selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              title: Text("Category")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text("Favorite"))
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  void selectedPage(int value) {
    setState(() {
      selectedPageIndex = value;
    });
  }

  final List<Map<String, Object>> pages = [
    {"page": CategoryScreen(), "title": "Category Screen"},
    {"page": FavoriteScreen(), "title": "Favorite Screen"}
  ];
}
