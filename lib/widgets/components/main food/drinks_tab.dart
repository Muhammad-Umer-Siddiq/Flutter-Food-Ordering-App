import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/api models/drinks_model.dart';
import '../../../utilities/lists.dart';
import '../../custom widgets/alert_dialog_box.dart';
import '../../custom widgets/card_widget.dart';
import '../../custom widgets/cupertino_alert_dialog.dart';
import '../../custom widgets/grid_view_builder.dart';
import 'food_display_tile.dart';

class DrinksTab extends StatefulWidget {
  const DrinksTab({super.key});

  @override
  State<DrinksTab> createState() => _DrinksTabState();
}

class _DrinksTabState extends State<DrinksTab> {
  void _showDialogAndroid() {
    showDialog(
        context: context,
        builder: (context) => MyAlertDialog(
              title: 'Coming Soon!',
              actionsAlignment: MainAxisAlignment.center,
              content: "Soon you would be allowed to see details & order them",
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
            ));
  }

  void _showDialogIOS() {
    showDialog(
        context: context,
        builder: (context) => MyCupertinoAlertDialog(
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
              title: 'Coming Soon',
              content: "Soon you would be allowed to see details & order them",
            ));
  }

  Future fetchDrinksData() async {
    const url =
        'https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Vodka';
    var uri = Uri.parse(url);
    final response = await http.get(uri);
    log(response.statusCode.toString());

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body);
      var drinksJson = data['drinks'] as List;
      setState(() {
        drinksList = drinksJson.map((e) => Drinks.fromJson(e)).toList();
      });
      return drinksList;
    } else {
      log(response.body.toString());
    }
  }

  @override
  void initState() {
    fetchDrinksData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return drinksList.isEmpty
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.red.shade700,
            ),
          )
        : MyGridViewBuilder(
            itemCount: drinksList.length,
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
                          drinksList[index].strDrinkThumb.toString()),
                      foodName: drinksList[index].strDrink,
                      bottomWidget: Text(
                        "Meal # ${drinksList[index].idDrink ?? ""}",
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
