import 'package:flutter/material.dart';

import '../widgets/components/main food/chicken_meal_tab.dart';
import '../widgets/components/main food/drinks_tab.dart';
import '../widgets/components/main food/meals_tab.dart';
import '../widgets/components/main food/popular_food_tab.dart';
import 'main_food_screen.dart';

class FullMenuScreen extends StatefulWidget {
  const FullMenuScreen({super.key});

  @override
  State<FullMenuScreen> createState() => _FullMenuScreenState();
}

class _FullMenuScreenState extends State<FullMenuScreen> {
  final List<String> _tabsTitle = ['Popular', 'Meals', 'Drinks', 'Chicken'];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
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
            bottom: TabBar(
                unselectedLabelColor: Colors.white,
                labelColor: Colors.white,
                labelStyle: TextStyle(fontSize: width < 400 ? 17 : 19),
                unselectedLabelStyle:
                    TextStyle(fontSize: width < 400 ? 16 : 18),
                tabs: List.generate(
                    4,
                    (index) => Tab(
                          child: Text(
                            _tabsTitle[index],
                            maxLines: 1,
                          ),
                        ))),
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
