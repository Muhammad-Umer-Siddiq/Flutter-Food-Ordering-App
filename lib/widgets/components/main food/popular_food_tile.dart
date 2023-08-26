import 'dart:io';

import 'package:flutter/material.dart';

import '../../../screens/cart_screen.dart';
import '../../../screens/each_food_details_screen.dart';
import '../../../utilities/helpers.dart';
import '../../../utilities/lists.dart';
import '../../custom widgets/alert_dialog_box.dart';
import '../../custom widgets/card_widget.dart';
import '../../custom widgets/cupertino_alert_dialog.dart';

class PopularFoodTile extends StatefulWidget {
  const PopularFoodTile({super.key});

  @override
  State<PopularFoodTile> createState() => _PopularFoodTileState();
}

class _PopularFoodTileState extends State<PopularFoodTile> {
  @override
  Widget build(BuildContext context) {
    // To show alert dialog box when user clicks on plus button to add food item
    void showDialogBox() {
      showDialog(
          context: context,
          builder: (context) => MyAlertDialog(
                title: "Food added to cart successfully",
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
              ));
    }

    void showDialogIOS() {
      showDialog(
        context: context,
        builder: (context) => MyCupertinoAlertDialog(
          title: "Food added to cart successfully",
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
                            Platform.isIOS ? showDialogIOS() : showDialogBox();
                            CartItemsHelpers()
                                .addToCart(popularFoodList[index]);
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
