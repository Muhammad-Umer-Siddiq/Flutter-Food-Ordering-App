import 'package:flutter/material.dart';

import '../../../screens/each_food_details_screen.dart';
import '../../../utilities/lists.dart';
import '../../custom widgets/card_widget.dart';
import '../../custom widgets/grid_view_builder.dart';
import 'food_display_tile.dart';

class PopularFoodTab extends StatefulWidget {
  const PopularFoodTab({super.key});

  @override
  State<PopularFoodTab> createState() => _PopularFoodTabState();
}

class _PopularFoodTabState extends State<PopularFoodTab> {
  @override
  Widget build(BuildContext context) {
    return MyGridViewBuilder(
      itemCount: popularFoodList.length,
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
                        isFoodInApi: false,
                        popularFoodItem: popularFoodList[index],
                      ),
                    ));
              },
              contentWidget: FoodDisplayTile(
                foodImage: Image.asset(popularFoodList[index].foodImageURL),
                foodName: popularFoodList[index].foodName,
                bottomWidget: Text(
                  "Rs.${popularFoodList[index].foodPrice}",
                  textScaleFactor: 1,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        );
      },
    );
  }
}
