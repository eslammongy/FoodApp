import 'package:flutter/material.dart';
import 'package:food_app/model/meal.dart';
import 'package:food_app/widget/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> listFavoriteMeal;
  FavoriteScreen(this.listFavoriteMeal);
  @override
  Widget build(BuildContext context) {
    if (listFavoriteMeal.isEmpty) {
      return Container(
        color: Color(0xff373737),
        child: Center(
          child: Text(
            "Favorite Screen",
            style: TextStyle(fontSize: 30, color: Colors.black87),
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (cnxt, index) {
          return MealItemScreen(
            id: listFavoriteMeal[index].id,
            title: listFavoriteMeal[index].title,
            imageUrl: listFavoriteMeal[index].imageUrl,
            complexity: listFavoriteMeal[index].complexity,
            duration: listFavoriteMeal[index].duration,
            affordability: listFavoriteMeal[index].affordability,
          );
        },
        itemCount: listFavoriteMeal.length,
      );
    }
  }
}
