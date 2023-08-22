import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/api_models/meals_model.dart';
import '../models/custom_models/cart_item.dart';
import '../models/custom_models/popular_food.dart';
import '../utilities/helpers.dart';
import '../utilities/values.dart';
import '../widgets/custom_widgets/custom_card_widget.dart';
import '../widgets/custom_widgets/custom_elevated_button.dart';
import '../widgets/custom_widgets/custom_sized_box.dart';
import 'cart_screen.dart';

class EachFoodDetailsScreen extends StatefulWidget {
  final PopularFoodModel? foodCustomItem; // for static data & model
  final Categories? categoriesFoodItem; // for dynamic data & model
  final bool isFoodInApi;

  const EachFoodDetailsScreen({
    super.key,
    required this.isFoodInApi,
    this.categoriesFoodItem,
    this.foodCustomItem,
  });

  @override
  State<EachFoodDetailsScreen> createState() => _EachFoodDetailsScreenState();
}

class _EachFoodDetailsScreenState extends State<EachFoodDetailsScreen> {
  void _showDialogAndroid() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Coming Soon!',
            textScaleFactor: 1,
            textAlign: TextAlign.center,
          ),
          titleTextStyle: const TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
          content: const Text(
            "Soon you would be allow to order these food",
            textScaleFactor: 1,
            textAlign: TextAlign.center,
          ),
          contentTextStyle: const TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
          elevation: 10,
          actionsOverflowButtonSpacing: 20,
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "View Full Menu",
                style: TextStyle(fontSize: 19, color: Colors.red.shade900),
              ),
            ),
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
        title: const Text('Coming Soon',
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "View Full Menu",
              style: TextStyle(fontSize: 19, color: Colors.red.shade900),
            ),
          ),
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
        content: const Text("Soon you would be allow to order these food",
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
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(),
      body: widget.isFoodInApi
          ? SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              child: Stack(
                children: [
                  SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Image.network(
                      widget.categoriesFoodItem!.strCategoryThumb.toString(),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                      top: 220,
                      child: MyCard(
                        elevation: 15,
                        borderCurve: 30,
                        containerWidth: MediaQuery.of(context).size.width * 1,
                        containerHeight: MediaQuery.of(context).size.height * 1,
                        contentWidget: Column(
                          children: <Widget>[
                            const MySizedBox(),
                            const MySizedBox(heightRatio: 0.02),
                            Text(
                              widget.categoriesFoodItem!.strCategory.toString(),
                              style: const TextStyle(
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            const MySizedBox(),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                widget
                                    .categoriesFoodItem!.strCategoryDescription
                                    .toString(),
                                textAlign: TextAlign.center,
                                maxLines: 6,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            const MySizedBox(heightRatio: 0.03),
                            Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200,
                              ),
                              alignment: Alignment.centerLeft,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Text(
                                  " Add some extras",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                            ),
                            const MySizedBox(heightRatio: 0.04),
                            //                             Row(
                            //                               children: [
                            //                                 Checkbox(
                            //                                   value: isExtraChecked,
                            //                                   onChanged: (value) {
                            //                                     setState(() {
                            //                                       checkExtras();
                            //                                     });
                            //                                   },
                            //                                 ),
                            //                                 Text(
                            //                                   widget.foodCustomItem!.foodExtras,
                            //                                   style: const TextStyle(fontSize: 17.5),
                            //                                 ),
                            //                                 const Expanded(
                            //                                     flex: 8, child: SizedBox(width: 110)),
                            //                                 const Expanded(
                            //                                   flex: 4,
                            //                                   child: Text(
                            //                                     "Rs 70",
                            //                                     style: TextStyle(fontSize: 17),
                            //                                   ),
                            //                                 ),
                            //                               ],
                            //                             ),
                            const MySizedBox(),
                            MyElevatedButton(
                              buttonColor: Colors.red.shade300,
                              borderColor: Colors.red.shade300,
                              buttonAlignment: Alignment.center,
                              buttonText: "Add to cart",
                              buttonPress: () {
                                Platform.isIOS
                                    ? _showDialogIOS()
                                    : _showDialogAndroid();
                              },
                              buttonWidthRatio: 0.8,
                              elevation: 40,
                            )
                          ],
                        ),
                      )),
                ],
              ),
            )
          : SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              child: Stack(
                children: [
                  SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Image.asset(
                      widget.foodCustomItem!.foodImageURL,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                      top: 220,
                      child: MyCard(
                        elevation: 15,
                        borderCurve: 30,
                        containerWidth: MediaQuery.of(context).size.width * 1,
                        containerHeight: MediaQuery.of(context).size.height * 1,
                        contentWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const MySizedBox(),
                            Container(
                              width: width * 0.28,
                              height: height * 0.1,
                              constraints: const BoxConstraints(maxWidth: 170),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  // For minus
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (widget
                                                .foodCustomItem!.foodQuantity >
                                            0) {
                                          widget.foodCustomItem!.foodQuantity--;
                                        }
                                      });
                                    },
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      padding: const EdgeInsets.all(4),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade900,
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: const Icon(
                                        CupertinoIcons.minus,
                                        color: Colors.white,
                                        size: 23,
                                      ),
                                    ),
                                  ),

                                  // number counter
                                  Container(
                                    width: 37,
                                    height: 37,
                                    alignment: Alignment.center,
                                    child: Text(
                                      widget.foodCustomItem!.foodQuantity
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: widget.foodCustomItem!
                                                      .foodQuantity ==
                                                  10
                                              ? 25
                                              : 26,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),

                                  // For plus
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (widget
                                                .foodCustomItem!.foodQuantity <
                                            10) {
                                          widget.foodCustomItem!.foodQuantity++;
                                        }
                                      });
                                    },
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade900,
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 23,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Flexible(
                              child: Text(
                                widget.foodCustomItem!.foodName,
                                maxLines: 1,
                                textScaleFactor: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 29,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            const MySizedBox(),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                widget.foodCustomItem!.foodDescription,
                                textAlign: TextAlign.center,
                                textScaleFactor: 1,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 6,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            const MySizedBox(heightRatio: 0.02),
                            Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200,
                              ),
                              alignment: Alignment.centerLeft,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Text(
                                  " Add some extras",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                            ),
                            const MySizedBox(heightRatio: 0.02),
                            Row(
                              children: [
                                Checkbox(
                                  value: isExtraChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      checkExtras();
                                    });
                                  },
                                ),
                                Text(
                                  widget.foodCustomItem!.foodExtras,
                                  style: const TextStyle(fontSize: 17.5),
                                ),
                                const Expanded(
                                    flex: 8, child: SizedBox(width: 110)),
                                const Expanded(
                                  flex: 4,
                                  child: Text(
                                    "Rs 70",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                            const MySizedBox(),
                            MyElevatedButton(
                              buttonAlignment: Alignment.center,
                              buttonText: "Add to cart",
                              buttonPress: () {
                                addToCart(widget.foodCustomItem);

                                setState(() {
                                  widget.foodCustomItem!.foodQuantity++;
                                  // Check if the item is already in the cart
                                });

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CartScreen(
                                        cartItems: cartItems,
                                      ),
                                    ));
                              },
                              elevation: 40,
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
    );
  }
}
