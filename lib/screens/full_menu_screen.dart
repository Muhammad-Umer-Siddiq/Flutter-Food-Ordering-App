import 'package:flutter/material.dart';

import '../widgets/components/main_food/chicken_meal_tab.dart';
import '../widgets/components/main_food/drinks_tab.dart';
import '../widgets/components/main_food/meals_tab.dart';
import '../widgets/components/main_food/popular_food_tab.dart';
import 'main_food_screen.dart';

class FullMenuScreen extends StatefulWidget {
  const FullMenuScreen({super.key});

  @override
  State<FullMenuScreen> createState() => _FullMenuScreenState();
}

class _FullMenuScreenState extends State<FullMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      animationDuration: const Duration(milliseconds: 200),
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainFoodScreen(),
                        ));
                  },
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ))
            ],
            bottom: const TabBar(
              unselectedLabelColor: Colors.white,
              labelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 19),
              unselectedLabelStyle: TextStyle(fontSize: 18),
              tabs: [
                Tab(
                  child: Text(
                    "Popular",
                  ),
                ),
                Tab(
                  child: Text(
                    "Meals",
                  ),
                ),
                Tab(
                  child: Text(
                    "Drinks",
                  ),
                ),
                Tab(
                  child: Text(
                    "Chicken",
                  ),
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            toolbarHeight: 75,
            title: const Text(" F U L L   M E N U "),
            backgroundColor: Colors.red.shade700,
            titleTextStyle: const TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.grey.shade200,
          body: const TabBarView(
            children: [
              PopularFoodTab(),
              MealsTab(),
              DrinksTab(),
              ChickenMealTab(),
            ],
          )),
    );
  }
}
