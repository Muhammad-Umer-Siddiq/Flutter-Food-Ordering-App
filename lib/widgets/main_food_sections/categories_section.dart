import 'package:flutter/material.dart';

import '../../models/custom_models/custom_category_model.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: foodCategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Card(
                color: Colors.white,
                child: Container(
                  width: 50,
                  height: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Image.asset(
                        foodCategories[index].iconURL,
                        fit: BoxFit.contain,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(height: 4),
                      Text(foodCategories[index].iconName,
                          style: const TextStyle(
                              fontSize: 9.6, color: Colors.black))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
