import 'package:flutter/material.dart';
import 'package:food_app/model/meal.dart';
import 'package:food_app/screen/meal_details_screen.dart';

class MealItemScreen extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;
  MealItemScreen(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.complexity,
      @required this.duration,
      @required this.affordability,
      @required this.removeItem});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "UnKnow";
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "UnKnow";
        break;
    }
  }

  void selectedMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailsScreen.MealDetailsScreenID, arguments: id)
        .then((value) {
      if (value != null) removeItem(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.black54,
                    width: 200,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 10,
                      ),
                      Text("$duration min")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 10,
                      ),
                      Text("$complexityText")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      Text("$affordabilityText")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
