import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/api models/meals_model.dart';
import '../../../screens/each_food_details_screen.dart';
import '../../../utilities/lists.dart';
import '../../custom widgets/card_widget.dart';
import '../../custom widgets/grid_view_builder.dart';
import 'food_display_tile.dart';

class MealsTab extends StatefulWidget {
  const MealsTab({super.key});

  @override
  State<MealsTab> createState() => _MealsTabState();
}

class _MealsTabState extends State<MealsTab> {
  Future fetchMealsData() async {
    const url = 'https://www.themealdb.com/api/json/v1/1/categories.php';
    var uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body);
      var mealsJson = data['categories'] as List;

      setState(() {
        regularMealsList =
            mealsJson.map((e) => Categories.fromJson(e)).toList();
      });
      return regularMealsList;
    } else {
      log(response.body);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMealsData();
  }

  @override
  Widget build(BuildContext context) {
    return regularMealsList.isEmpty
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.red.shade700,
            ),
          )
        : MyGridViewBuilder(
            itemCount: regularMealsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: MyCard(
                    elevation: 6,
                    cardTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EachFoodDetailsScreen(
                              isFoodInApi: true,
                              categoriesFoodItem: regularMealsList[index],
                            ),
                          ));
                    },
                    contentWidget: FoodDisplayTile(
                        foodImage: Image.network(regularMealsList[index]
                            .strCategoryThumb
                            .toString()),
                        foodName: regularMealsList[index].strCategory,
                        bottomWidget: Text(
                          "Meal # ${regularMealsList[index].idCategory}",
                          textScaleFactor: 1,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
              );
            },
          );
  }
}
