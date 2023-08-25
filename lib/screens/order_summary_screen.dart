import 'package:flutter/material.dart';

import '../models/custom_models/cart_item.dart';
import '../utilities/consts.dart';
import '../utilities/helpers.dart';
import '../widgets/components/delivery_process/delivery_details_tile.dart';
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

  String _name = '', _address = '', _phoneNumber = '';

  void _registerDetails() {
    _name = nameControllerR.text;
    _address = streetControllerR.text;
    _phoneNumber = phoneControllerR.text;
  }

  void _newDetails() {
    _name = nameControllerD.text;
    _address = streetControllerD.text;
    _phoneNumber = phoneControllerD.text;
  }

  void _assignDetails() {
    areFieldsEmpty() ? _registerDetails() : _newDetails();
  }

  @override
  void setState(VoidCallback fn) {
    _assignDetails();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Summary"),
        centerTitle: true,
        titleTextStyle: const TextStyle(fontSize: 23, color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MySizedBox(
              widthRatio: 0.9,
              heightRatio: 0.48,
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
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: ListView.separated(
                            separatorBuilder: (context, index) => const Divider(
                              height: 2,
                              color: Colors.black54,
                              thickness: 1,
                              indent: 15,
                              endIndent: 15,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: cartItems.length,
                            itemBuilder: (context, index) {
                              int foodItemTotalPrice =
                                  ((cartItems[index].food!.foodPrice) *
                                      (cartItems[index].food!.foodQuantity));
                              return SizedBox(
                                child: ListTile(
                                  title: Text(cartItems[index].food!.foodName),
                                  subtitle: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Total items: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.5),
                                      ),
                                      Text(
                                        cartItems[index]
                                            .food!
                                            .foodQuantity
                                            .toString(),
                                        style: const TextStyle(fontSize: 12.5),
                                      ),
                                    ],
                                  ),
                                  titleTextStyle: const TextStyle(
                                      fontSize: 16, color: Colors.black),
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
                                    style: const TextStyle(
                                      fontSize: 15.5,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sub total',
                            textScaleFactor: 1,
                            maxLines: 1,
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Rs ${calculateTotalPrice(cartItems)}",
                            textScaleFactor: 1,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
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
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Rs $_deliveryFee",
                            textScaleFactor: 1,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            MySizedBox(
              widthRatio: 0.9,
              heightRatio: 0.20,
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
                        'Delivery Address',
                        style: TextStyle(
                            fontSize: 21,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(bottom: 2.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  DeliveryDetailsTile(
                                    title: 'Name: ',
                                    details: _name,
                                  ),
                                  DeliveryDetailsTile(
                                    title: 'Address: ',
                                    details: _address,
                                  ),
                                  DeliveryDetailsTile(
                                      title: 'Phone: ', details: _phoneNumber),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              child: MySizedBox(
                widthRatio: 0.9,
                heightRatio: 0.25,
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
