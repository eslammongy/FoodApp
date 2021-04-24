import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static String MealDetailsScreenID = "Meal_Details";
  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text(mealID),
      ),
      body: Text(
        mealID,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
