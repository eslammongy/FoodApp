import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screen/meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem(this.id, this.title, this.color);

  void selectedCategoryItem(BuildContext context) {
    Navigator.of(context).pushNamed(MealScreen.MealScreenID,
        arguments: {"id": id, "title": title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategoryItem(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.6), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
