import 'package:flutter/material.dart';
import 'package:food_app/widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const FilterScreenID = "filteres";
  final Function saveFilters;
  final Map<String, bool> filtersSwitch;
  FilterScreen(this.filtersSwitch, this.saveFilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  @override
  initState() {
    isGlutenFree = widget.filtersSwitch["gluten"];
    isLactoseFree = widget.filtersSwitch["lactose"];
    isVegan = widget.filtersSwitch["vegan"];
    isVegetarian = widget.filtersSwitch["vegetarian"];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff373737),
      appBar: AppBar(
        title: Text(
          "Filter",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w900, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                final Map<String, bool> selectedFilter = {
                  "gluten": isGlutenFree,
                  "lactose": isLactoseFree,
                  "vegan": isVegan,
                  "vegetarian": isVegetarian
                };
                widget.saveFilters(selectedFilter);
              },
              icon: Icon(Icons.done_outline))
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Adjust your meal selection.",
                style: TextStyle(
                    fontSize: 25, fontFamily: "Raleway", color: Colors.white),
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchTile(
                "Gluten Free",
                "Only include gluten free meals.",
                isGlutenFree,
                (bool value) {
                  setState(() {
                    isGlutenFree = value;
                  });
                },
              ),
              buildSwitchTile(
                "Lactose Free",
                "Only include Lactose Free meals.",
                isLactoseFree,
                (value) {
                  setState(() {
                    isLactoseFree = value;
                  });
                },
              ),
              buildSwitchTile(
                "Vegetarian",
                "Only include Vegetarian meals.",
                isVegetarian,
                (value) {
                  setState(() {
                    isVegetarian = value;
                  });
                },
              ),
              buildSwitchTile(
                "Vegan",
                "Only include Vegan meals.",
                isVegan,
                (value) {
                  setState(() {
                    isVegan = value;
                  });
                },
              )
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  Widget buildSwitchTile(
      String title, String subTitle, bool currentState, Function updateValue) {
    return SwitchListTile(
        title: Text(title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: "Raleway",
                color: Colors.white)),
        subtitle: Text(subTitle,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                fontFamily: "Raleway",
                color: Colors.blueGrey)),
        value: currentState,
        onChanged: updateValue);
  }
}
