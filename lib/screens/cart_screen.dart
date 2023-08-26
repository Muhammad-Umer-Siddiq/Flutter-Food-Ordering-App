import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/custom models/cart_item.dart';
import '../utilities/helpers.dart';
import '../utilities/lists.dart';
import '../widgets/custom widgets/card_widget.dart';
import '../widgets/custom widgets/elevated_button.dart';
import '../widgets/custom widgets/responsive_text.dart';
import 'delivery_address_screen.dart';
import 'full_menu_screen.dart';

class CartScreen extends StatefulWidget {
  final List<CartItem> cartItems;
  const CartScreen({super.key, required this.cartItems});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _showDialogAndroid() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Cart is Empty',
            textScaleFactor: 1,
            textAlign: TextAlign.center,
          ),
          titleTextStyle: const TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
          content: const Text(
            "Add food items to proceed",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
          ),
          contentTextStyle: const TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
          elevation: 10,
          actionsOverflowButtonSpacing: 20,
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            SizedBox(
              width: 150,
              child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Okay",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  )),
            )
          ],
        );
      },
    );
  }

  void _showDialogIOS() {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Cart is Empty',
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        actions: [
          SizedBox(
            width: 150,
            child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Okay",
                  textAlign: TextAlign.center,
                  textScaleFactor: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 19, color: Colors.white),
                )),
          )
        ],
        content: const Text("Add food items to proceed",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
            )),
      ),
    );
  }

  @override
  void setState(VoidCallback fn) {
    CartItemsHelpers().calculateTotalPrice(cartItems);

    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("My Cart"),
        centerTitle: true,
        elevation: 0,
        surfaceTintColor: Colors.white,
        titleTextStyle: const TextStyle(fontSize: 22, color: Colors.black),
      ),
      body: Column(
        children: [
          // displaying the food which are added to cart
          cartItems.isEmpty
              ? Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: MyResponsiveText(
                        'Your cart is empty!',
                        scaleFactor: 0.017,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                )
              : Expanded(
                  flex: 2,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      var foodItemTotalPrice = 0;
                      foodItemTotalPrice = ((cartItems[index].food!.foodPrice) *
                          (cartItems[index].food!.foodQuantity));

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyCard(
                          elevation: 6,
                          containerHeight: 80,
                          contentWidget: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                cartItems[index].food!.foodImageURL,
                                fit: BoxFit.contain,
                                height: 70,
                                width: 70,
                              ),
                              Text(
                                cartItems[index].food!.foodName,
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                "Rs $foodItemTotalPrice",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

          // displaying total prices & checkout button
          Expanded(
              child: MyCard(
            elevation: 25,
            borderCurve: 22,
            containerHeight: MediaQuery.sizeOf(context).height * 1,
            containerWidth: MediaQuery.sizeOf(context).width * 1,
            contentWidget: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Total Price',
                      textScaleFactor: 1,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rs. ${CartItemsHelpers().calculateTotalPrice(cartItems)}",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                          textScaleFactor: 1,
                        ),
                        const Text(
                          "(Delivery fees is not included)",
                          textScaleFactor: 1,
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
                Flexible(
                  child: MyElevatedButton(
                    elevation: 0,
                    buttonColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    textCoLor: Colors.red.shade800,
                    buttonText: "Add items",
                    buttonPress: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FullMenuScreen(),
                          ));
                    },
                  ),
                ),
                Flexible(
                  child: MyElevatedButton(
                    surfaceTintColor: Colors.red,
                    buttonText: "CheckOut",
                    buttonPress: () {
                      if (cartItems.isEmpty) {
                        Platform.isIOS
                            ? _showDialogIOS()
                            : _showDialogAndroid();
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const DeliveryAddressScreen(),
                            ));
                      }
                    },
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
