import 'package:flutter/material.dart';
import 'package:food_app/dummy_data.dart';
import 'package:food_app/model/meal.dart';
import 'package:food_app/widget/meal_item.dart';

class MealScreen extends StatefulWidget {
  static const String MealScreenID = "Meal_Screen";
  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  String mealTitle;
  List<Meal> mealItems;

  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealID = routeArg["id"];
    mealTitle = routeArg["title"];
    mealItems = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(mealID);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(mealTitle),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (cnxt, index) {
            return MealItemScreen(
                id: mealItems[index].id,
                title: mealItems[index].title,
                imageUrl: mealItems[index].imageUrl,
                complexity: mealItems[index].complexity,
                duration: mealItems[index].duration,
                affordability: mealItems[index].affordability,
                removeItem: removeItems);
          },
          itemCount: mealItems.length,
        ));
  }

  void removeItems(String mealId) {
    setState(() {
      mealItems.removeWhere((element) => element.id == mealId);
    });
  }
}
