import 'package:flutter/material.dart';

import '../../../models/custom_models/category_food.dart';
import '../../../screens/full_menu_screen.dart';
import '../../custom_widgets/custom_card_widget.dart';

class CategoriesTile extends StatelessWidget {
  const CategoriesTile({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return SizedBox(
      height: 90,
      child: ListView.builder(
        itemExtent: width > 1000 ? 120 : 90,
        itemCount: foodCategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(4),
              child: MyCard(
                cardTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FullMenuScreen(),
                      ));
                },
                elevation: 5,
                contentWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      foodCategories[index].iconURL,
                      fit: BoxFit.cover,
                      width: 26,
                    ),
                    Text(
                      foodCategories[index].iconName,
                      textScaleFactor: 1,
                      maxLines: 1,
                      style:
                          const TextStyle(fontSize: 12.5, color: Colors.black),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
