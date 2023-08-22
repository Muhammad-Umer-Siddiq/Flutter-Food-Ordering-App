import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/api_models/meals_model.dart';
import '../../utilities/lists.dart';
import '../../widgets/custom_widgets/custom_card_widget.dart';
import '../../widgets/custom_widgets/custom_sized_box.dart';
import '../each_food_details_screen.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  Future getMealsData() async {
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
    getMealsData();
  }

  @override
  Widget build(BuildContext context) {
    return mealsList.isEmpty
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.red.shade700,
            ),
          )
        : GridView.builder(
            itemCount: mealsList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 195),
            itemBuilder: (context, mealsIndex) {
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
                            categoriesFoodItem: mealsList[mealsIndex],
                          ),
                        ));
                  },
                  contentWidget: Column(
                    children: [
                      const MySizedBox(heightRatio: 0.02),
                      Expanded(
                        flex: 0,
                        child: SizedBox(
                          height: 90,
                          width: 105,
                          child: Image.network(
                            mealsList[mealsIndex].strCategoryThumb.toString(),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Text(
                        mealsList[mealsIndex].strCategory.toString(),
                        style: const TextStyle(
                          fontSize: 19.5,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Meal # ${mealsList[mealsIndex].idCategory ?? ""}",
                        style: const TextStyle(
                          fontSize: 17.5,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
