import 'package:flutter/material.dart';
import 'package:food_app/widget/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const FilterScreenID = "filteres";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Filter",
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w900, color: Colors.white),
      )),
      body: Text(
        "Food App",
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w900, color: Colors.white),
      ),
      drawer: MainDrawer(),
    );
  }
}
