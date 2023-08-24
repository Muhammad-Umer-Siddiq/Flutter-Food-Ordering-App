import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/custom_models/cart_item.dart';

import '../../../screens/cart_screen.dart';
import '../../../screens/each_food_details_screen.dart';
import '../../../utilities/lists.dart';
import '../../custom_widgets/custom_card_widget.dart';

class PopularFoodTile extends StatefulWidget {
  const PopularFoodTile({super.key});

  @override
  State<PopularFoodTile> createState() => _PopularFoodTileState();
}

class _PopularFoodTileState extends State<PopularFoodTile> {
  @override
  Widget build(BuildContext context) {
    // To show alert dialog box when user clicks on plus button to add food item
    void _showDialog() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceBetween,
          backgroundColor: Colors.red.shade50,
          title: const Text(
            "Food added to cart successfully",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(
                        cartItems: cartItems,
                      ),
                    ));
              },
              child: const Text(
                "View cart",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red.shade400,
              ),
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      height: 220,
      child: ListView.builder(
        itemExtent: 190,
        scrollDirection: Axis.horizontal,
        itemCount: popularFoodList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyCard(
              elevation: 10,
              cardTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EachFoodDetailsScreen(
                          isFoodInApi: false,
                          popularFoodItem: popularFoodList[index]),
                    ));
              },
              contentWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      popularFoodList[index].foodImageURL,
                      fit: BoxFit.contain,
                      width: 75,
                      height: 60,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      popularFoodList[index].foodName,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      textScaleFactor: 1,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Rs ${popularFoodList[index].foodPrice} ",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              popularFoodList[index].foodQuantity++;
                            });

                            _showDialog();
                            addToCart(popularFoodList[index]);
                          },
                          child: Container(
                            height: 20,
                            width: 26,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red.shade700,
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 17,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
