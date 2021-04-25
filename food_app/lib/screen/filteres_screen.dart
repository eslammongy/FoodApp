import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static const FilterScreenID = "filteres";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Food App",
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w900, color: Colors.white),
      ),
    );
  }
}
