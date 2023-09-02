import 'dart:developer';

import '../../utilities/imports.dart';

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
      builder: (context) => CustomAlertDialog(
        title: 'Cart is Empty',
        content: 'Add food items to proceed',
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          CustomTextButton(
            text: 'Ok',
            buttonPress: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  void _showDialogIOS() {
    showDialog(
      context: context,
      builder: (context) => CustomCupertinoAlertDialog(
        title: 'Cart is Empty',
        content: 'Add food items to proceed',
        actions: [
          CustomTextButton(
            text: 'Ok',
            buttonPress: () => Navigator.pop(context),
          ),
        ],
      ),
    );
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
        children: <Expanded>[
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
                      int foodItemTotalPrice = 0;
                      if (cartItems[index].food!.extrasCheck) {
                        foodItemTotalPrice =
                            ((cartItems[index].food!.foodPrice +
                                    cartItems[index].food!.extrasPrice) *
                                (cartItems[index].quantity));
                      } else {
                        foodItemTotalPrice =
                            ((cartItems[index].food!.foodPrice) *
                                (cartItems[index].quantity));
                      }

                      log('Total price for ${cartItems[index].food!.foodName}: Rs. $foodItemTotalPrice (CS)');

                      log('Total price after above food added to cart is: Rs. ${CartItemsHelpers.calculateTotalPrice(cartItems)} (CS)');
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomCard(
                          elevation: 6,
                          height: 80,
                          contentWidget: Stack(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
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
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 23,
                                    height: 23,
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: Colors.red.shade800,
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(18),
                                            bottomLeft: Radius.circular(16))),
                                    child: Text(
                                      cartItems[index].quantity.toString(),
                                      textScaleFactor: 1,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: cartItems[index].quantity > 9
                                            ? 10.5
                                            : 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                              Align(
                                alignment: Alignment.topLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      cartItems.removeAt(index);
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    width: 23,
                                    height: 23,
                                    child: Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.red.shade800,
                                      size: 20,
                                    ),
                                  ),
                                ),
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
              child: CustomCard(
            elevation: 25,
            borderCurve: 22,
            height: MediaQuery.sizeOf(context).height * 1,
            width: MediaQuery.sizeOf(context).width * 1,
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
                      children: <Text>[
                        Text(
                          "Rs. ${CartItemsHelpers.calculateTotalPrice(cartItems)}",
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
                  child: CustomElevatedButton(
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
                  child: CustomElevatedButton(
                    elevation: 5,
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
