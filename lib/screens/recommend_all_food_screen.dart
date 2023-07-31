import 'package:flutter/material.dart';

import '../models/custom_models/custom_recommended_model.dart';
import '../widgets/custom_widgets/custom_sized_box_media_query.dart';
import 'each_food_details_screen.dart';

class RecommendedAllFoodScreen extends StatefulWidget {
  const RecommendedAllFoodScreen({super.key});

  @override
  State<RecommendedAllFoodScreen> createState() =>
      _RecommendedAllFoodScreenState();
}

class _RecommendedAllFoodScreenState extends State<RecommendedAllFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Full Menu"),
        centerTitle: true,
        backgroundColor: Colors.red.shade700,
        titleTextStyle: const TextStyle(fontSize: 24, color: Colors.white),
      ),
      backgroundColor: Colors.grey.shade300,
      body: GridView.builder(
        itemCount: foodRecommended.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 180),
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EachFoodDetailsScreen(
                            foodItem: foodRecommended[index]),
                      ));
                },
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Column(
                        children: [
                          const MySizedBox(widthRatio: 0.04),
                          Image.asset(
                            foodRecommended[index].foodImageURL,
                            width: 86,
                            height: 86,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            foodRecommended[index].foodName,
                            style: const TextStyle(
                                fontSize: 17.5, color: Colors.black),
                          ),
                          Text(
                            foodRecommended[index].foodPrice,
                            style: const TextStyle(
                                fontSize: 19.5,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ),
              ));
        },
      ),
    );
  }
}
