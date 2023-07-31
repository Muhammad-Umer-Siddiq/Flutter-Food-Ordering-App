import 'package:flutter/material.dart';

import '../models/custom_models/custom_recommended_model.dart';
import '../widgets/custom_widgets/custom_sized_box_media_query.dart';
import '../widgets/main_food_sections/categories_section.dart';
import '../widgets/main_food_sections/discount_food_container.dart';
import '../widgets/main_food_sections/header_text.dart';
import '../widgets/main_food_sections/recommendation_section.dart';
import '../widgets/main_food_sections/search_food.dart';
import 'recommend_all_food_screen.dart';

class MainFoodScreen extends StatefulWidget {
  const MainFoodScreen({super.key});

  @override
  State<MainFoodScreen> createState() => _MainFoodScreenState();
}

class _MainFoodScreenState extends State<MainFoodScreen> {
  final _recommendationCounter = foodRecommended.length - 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 26,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              size: 26,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Hi Ahmed",
                style: TextStyle(color: Colors.red.shade800, fontSize: 23),
              ),
            ),
            Text(
              "Search and Order",
              style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
            ),
            const MySizedBox(heightRatio: 0.025),
            const DiscountFoodContainer(),
            const MySizedBox(heightRatio: 0.02),
            const SearchFood(),
            const Padding(
                padding: EdgeInsets.all(8.0),
                child: HeaderText(insideText: "Categories")),
            const CategoriesSection(),
            Padding(
              padding:
                  const EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 4),
              child: Row(
                children: [
                  const HeaderText(insideText: "Recommended"),
                  MySizedBox(
                      widthRatio: _recommendationCounter < 10 ? 0.32 : 0.29),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const RecommendedAllFoodScreen(),
                          ));
                    },
                    child: Text(
                      "View all ($_recommendationCounter)",
                      style: TextStyle(
                          color: Colors.redAccent.shade700,
                          fontSize: _recommendationCounter < 10 ? 18 : 16),
                    ),
                  ),
                  const MySizedBox(widthRatio: 0.07),
                ],
              ),
            ),
            const RecommendedSection()
          ],
        ),
      ),
    );
  }
}
