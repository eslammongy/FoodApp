import 'package:flutter/material.dart';
import 'package:food_app/dummy_data.dart';
import 'package:food_app/model/meal.dart';
import 'package:food_app/screen/bottom_navigation.dart';
import 'package:food_app/screen/category_screen.dart';
import 'package:food_app/screen/filteres_screen.dart';
import 'package:food_app/screen/meal_details_screen.dart';
import 'package:food_app/screen/meal_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Map<String, bool> filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false
  };

  List<Meal> showSelectedMeal = DUMMY_MEALS;
  List<Meal> favoriteMeal = [];

  void setFilters(Map<String, bool> filtersResult) {
    setState(() {
      filters = filtersResult;
      showSelectedMeal = DUMMY_MEALS.where((meal) {
        if (filters["gluten"] && !meal.isGlutenFree) {
          return false;
        }
        if (filters["lactose"] && !meal.isLactoseFree) {
          return false;
        }
        if (filters["vegan"] && !meal.isVegan) {
          return false;
        }
        if (filters["vegetarian"] && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void setFavoriteList(String mealID) {
    final currentIndex = favoriteMeal.indexWhere((meal) => meal.id == mealID);

    if (currentIndex >= 0) {
      setState(() {
        favoriteMeal.removeAt(currentIndex);
      });
    } else {
      setState(() {
        favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
      });
    }
  }

  bool isFavoriteMeal(String id) {
    return favoriteMeal.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 60, 30, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(30, 100, 80, 1),
              ),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoCondensed ",
                  color: Colors.white),
            ),
      ),
      //home: CategoryScreen(),
      routes: {
        "/": (context) => BottomTapScreen(favoriteMeal),
        MealScreen.MealScreenID: (context) => MealScreen(showSelectedMeal),
        MealDetailsScreen.MealDetailsScreenID: (context) =>
            MealDetailsScreen(isFavoriteMeal, setFavoriteList),
        FilterScreen.FilterScreenID: (context) =>
            FilterScreen(filters, setFilters)
      },
    );
  }
}
