import 'package:flutter/material.dart';
import 'package:food_app/screen/filteres_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.deepPurpleAccent,
            height: 150,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            child: Text(
              "Food App",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Meal", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile("Filters", Icons.settings, () {
            Navigator.of(context)
                .pushReplacementNamed(FilterScreen.FilterScreenID);
          })
        ],
      ),
    );
  }

  Widget buildListTile(String title, IconData iconData, Function tapFunction) {
    return ListTile(
      leading: (Icon(
        iconData,
        size: 26,
      )),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 20, fontFamily: "Raleway", fontWeight: FontWeight.w700),
      ),
      onTap: tapFunction,
    );
  }
}
