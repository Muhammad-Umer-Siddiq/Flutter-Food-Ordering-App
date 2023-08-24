import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_ordering_app/widgets/components/main_food/food_display_tile.dart';
import 'package:food_ordering_app/widgets/custom_widgets/custom_grid_view_builder.dart';
import 'package:http/http.dart' as http;

import '../../../models/api_models/meals_model.dart';
import '../../../screens/each_food_details_screen.dart';
import '../../../utilities/lists.dart';
import '../../custom_widgets/custom_card_widget.dart';

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
        mealsList = mealsJson.map((e) => Categories.fromJson(e)).toList();
      });
      return mealsList;
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
    return mealsList.isEmpty
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.red.shade700,
            ),
          )
        : MyGridViewBuilder(
            itemCount: mealsList.length,
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
                              categoriesFoodItem: mealsList[index],
                            ),
                          ));
                    },
                    contentWidget: FoodDisplayTile(
                        foodImage: Image.network(
                            mealsList[index].strCategoryThumb.toString()),
                        foodName: mealsList[index].strCategory,
                        bottomWidget: Text(
                          "Meal # ${mealsList[index].idCategory}",
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
