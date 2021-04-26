import 'package:flutter/material.dart';
import 'package:food_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static String MealDetailsScreenID = "Meal_Details";
  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Ingradients",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black87,
                      fontFamily: 'RobotoCondensed'),
                ),
              ),
              buildContainerView(
                ListView.builder(
                    itemBuilder: (context, index) => Card(
                          color: Theme.of(context).accentColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(selectedMeal.ingredients[index],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black87,
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
                      color: Colors.black87,
                      fontFamily: 'RobotoCondensed'),
                ),
              ),
              buildContainerView(
                ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(child: Text("${index + 1}")),
                          title: Text(selectedMeal.steps[index]),
                        ),
                    itemCount: selectedMeal.steps.length),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete_forever),
          onPressed: () {
            Navigator.of(context).pop(mealID);
          },
        ));
  }

  Widget buildContainerView(Widget child) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blueGrey,
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }
}
