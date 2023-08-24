import 'package:flutter/material.dart';
import 'package:food_ordering_app/models/custom_models/cart_item.dart';
import 'package:food_ordering_app/utilities/helpers.dart';

import '../models/api_models/meals_model.dart';
import '../models/custom_models/popular_food.dart';
import '../widgets/custom_widgets/custom_elevated_button.dart';
import '../widgets/custom_widgets/custom_sized_box.dart';
import 'cart_screen.dart';
import 'payment_screen.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({super.key});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  final _deliveryFee = 85;
  // Can change on order increasing

  PopularFoodModel? foodItem;
  Categories? foodItem2;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Summary"),
        centerTitle: true,
        titleTextStyle: const TextStyle(fontSize: 23, color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MySizedBox(
              widthRatio: 0.9,
              heightRatio: 0.40,
              child: Card(
                elevation: 15,
                color: Colors.white,
                shadowColor: Colors.white,
                surfaceTintColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Order Details',
                        style: TextStyle(
                            fontSize: 21,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(
                            height: 5,
                            color: Colors.transparent,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            var foodItemTotalPrice =
                                ((cartItems[index].food!.foodPrice) *
                                    (cartItems[index].food!.foodQuantity));

                            return SizedBox(
                              height: 40,
                              child: ListTile(
                                title: Text(cartItems[index].food!.foodName),
                                subtitle: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Total items: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    Text(
                                      cartItems[index]
                                          .food!
                                          .foodQuantity
                                          .toString(),
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                titleTextStyle: const TextStyle(
                                    fontSize: 18, color: Colors.black),
                                leading: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    cartItems[index].food!.foodImageURL,
                                    fit: BoxFit.contain,
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                trailing: Text(
                                  "Rs.$foodItemTotalPrice",
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sub total',
                            textScaleFactor: 1,
                            maxLines: 1,
                            style: TextStyle(fontSize: 17),
                          ),
                          Text(
                            "Rs ${calculateTotalPrice(cartItems)}",
                            textScaleFactor: 1,
                            maxLines: 1,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Delivery Fee',
                            textScaleFactor: 1,
                            maxLines: 1,
                            style: TextStyle(fontSize: 17),
                          ),
                          Text(
                            "Rs $_deliveryFee",
                            textScaleFactor: 1,
                            maxLines: 1,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const MySizedBox(
              widthRatio: 0.9,
              heightRatio: 0.20,
              child: Card(
                elevation: 15,
                color: Colors.white,
                shadowColor: Colors.white,
                surfaceTintColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery Address',
                        style: TextStyle(
                            fontSize: 21,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: MySizedBox(
                widthRatio: 0.9,
                child: Card(
                  elevation: 15,
                  color: Colors.white,
                  shadowColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyElevatedButton(
                          elevation: 0,
                          buttonWidthRatio: 0.6,
                          textSizeRatio: width > 390 ? 19 : 15,
                          buttonColor: Colors.white,
                          textCoLor: Colors.red.shade700,
                          buttonText: 'Edit Order',
                          buttonPress: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartScreen(
                                    cartItems: cartItems,
                                  ),
                                ));
                          },
                        ),
                        const MySizedBox(heightRatio: 0.03),
                        MyElevatedButton(
                          buttonWidthRatio: 0.6,
                          textSizeRatio: width > 390 ? 19 : 15,
                          buttonText: 'Proceed To Payment',
                          buttonPress: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PaymentScreen(),
                                ));
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
