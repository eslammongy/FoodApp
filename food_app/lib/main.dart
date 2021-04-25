import 'package:flutter/material.dart';
import 'package:food_app/screen/bottom_navigation.dart';
import 'package:food_app/screen/category_screen.dart';
import 'package:food_app/screen/filteres_screen.dart';
import 'package:food_app/screen/meal_details_screen.dart';
import 'package:food_app/screen/meal_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        "/": (context) => BottomTapScreen(),
        MealScreen.MealScreenID: (context) => MealScreen(),
        MealDetailsScreen.MealDetailsScreenID: (context) => MealDetailsScreen(),
        FilterScreen.FilterScreenID: (context) => FilterScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1D1F1F),
        appBar: AppBar(
          title: Text("Food App"),
        ),
        body: CategoryScreen());
  }
}
