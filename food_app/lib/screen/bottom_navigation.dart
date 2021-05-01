import 'package:flutter/material.dart';
import 'package:food_app/model/meal.dart';
import 'package:food_app/screen/category_screen.dart';
import 'package:food_app/screen/favorite_screen.dart';
import 'package:food_app/widget/main_drawer.dart';

class BottomTapScreen extends StatefulWidget {
  final List<Meal> listFavoriteMeal;
  BottomTapScreen(this.listFavoriteMeal);
  @override
  _BottomTapScreenState createState() => _BottomTapScreenState();
}

class _BottomTapScreenState extends State<BottomTapScreen> {
  int selectedPageIndex = 0;
  List<Map<String, Object>> pages;

  @override
  void initState() {
    pages = [
      {"page": CategoryScreen(), "title": "Category Screen"},
      {
        "page": FavoriteScreen(widget.listFavoriteMeal),
        "title": "Favorite Screen"
      }
    ];
    super.initState();
  }

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
}
