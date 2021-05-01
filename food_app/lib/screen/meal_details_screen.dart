import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static String MealDetailsScreenID = "Meal_Details";
  final Function setFavoriteList;
  final Function isFavoriteMeal;
  MealDetailsScreen(this.isFavoriteMeal, this.setFavoriteList);
  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    return Scaffold(
        backgroundColor: Color(0xff373737),
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  child: Image.network(
                    selectedMeal.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Ingradients",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              buildContainerView(
                ListView.builder(
                    itemBuilder: (context, index) => Card(
                          color: Colors.deepPurple,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(selectedMeal.ingredients[index],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'RobotoCondensed')),
                          ),
                        ),
                    itemCount: selectedMeal.ingredients.length),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Seteps",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              buildContainerView(
                ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(child: Text("${index + 1}")),
                          title: Text(
                            selectedMeal.steps[index],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                    itemCount: selectedMeal.steps.length),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child:
                Icon(isFavoriteMeal(mealID) ? Icons.star : Icons.star_border),
            onPressed: () => setFavoriteList(mealID)));
  }

  Widget buildContainerView(Widget child) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black26,
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }
}
