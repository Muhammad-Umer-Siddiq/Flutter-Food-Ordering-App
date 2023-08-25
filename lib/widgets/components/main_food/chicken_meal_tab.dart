import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/api_models/chicken_meals_model.dart';
import '../../../utilities/lists.dart';
import '../../custom_widgets/custom_card_widget.dart';
import '../../custom_widgets/custom_grid_view_builder.dart';
import 'food_display_tile.dart';

class ChickenMealTab extends StatefulWidget {
  const ChickenMealTab({super.key});

  @override
  State<ChickenMealTab> createState() => _ChickenMealTabState();
}

class _ChickenMealTabState extends State<ChickenMealTab> {
  void _showDialogAndroid() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Coming Soon!',
            textScaleFactor: 1,
            textAlign: TextAlign.center,
          ),
          titleTextStyle: const TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
          content: const Text(
            "Soon you would be allowed to see details & order them",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
          ),
          contentTextStyle: const TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
          elevation: 10,
          actionsOverflowButtonSpacing: 20,
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            SizedBox(
              width: 150,
              child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Okay",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  )),
            )
          ],
        );
      },
    );
  }

  void _showDialogIOS() {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Coming Soon',
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        actions: [
          SizedBox(
            width: 150,
            child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Okay",
                  textAlign: TextAlign.center,
                  textScaleFactor: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 19, color: Colors.white),
                )),
          )
        ],
        content:
            const Text("Soon you would be allowed to see details & order them",
                textScaleFactor: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                )),
      ),
    );
  }

  Future fetchChickenMealsData() async {
    const url =
        'https://www.themealdb.com/api/json/v1/1/filter.php?i=chicken_breast';
    var uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body);
      var chickenJson = data['meals'] as List;
      setState(() {
        chickenMealsList = chickenJson.map((e) => Meals.fromJson(e)).toList();
      });
      return chickenMealsList;
    } else {}
  }

  @override
  void initState() {
    super.initState();
    fetchChickenMealsData();
  }

  @override
  Widget build(BuildContext context) {
    return chickenMealsList.isEmpty
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.red.shade700,
            ),
          )
        : MyGridViewBuilder(
            itemCount: chickenMealsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: MyCard(
                    elevation: 6,
                    cardTap: () {
                      Platform.isIOS ? _showDialogIOS() : _showDialogAndroid();
                    },
                    contentWidget: FoodDisplayTile(
                      foodImage: Image.network(
                          chickenMealsList[index].strMealThumb.toString()),
                      foodName: chickenMealsList[index].strMeal,
                      bottomWidget: Text(
                        "Meal # ${chickenMealsList[index].idMeal ?? ""}",
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16.5,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              );
            },
          );
  }
}
