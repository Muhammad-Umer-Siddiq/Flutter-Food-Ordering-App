import '../../utilities/imports.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});

  final _deliveryFee = 85;

  // Can change on order increasing
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
            CustomSizedBox(
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
                    children: <Widget>[
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
                              var foodItemTotalPrice = 0;
                              if (cartItems[index].food!.extrasCheck) {
                                foodItemTotalPrice = ((cartItems[index]
                                            .food!
                                            .foodPrice +
                                        cartItems[index].food!.extrasPrice) *
                                    (cartItems[index].quantity));
                              } else {
                                foodItemTotalPrice =
                                    ((cartItems[index].food!.foodPrice) *
                                        (cartItems[index].quantity));
                              }

                              return SizedBox(
                                child: ListTile(
                                  title: Text(cartItems[index].food!.foodName),
                                  subtitle: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Text>[
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
                        children: <Widget>[
                          const Text(
                            'Sub total',
                            textScaleFactor: 1,
                            maxLines: 1,
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Rs. ${CartItemsHelpers.calculateTotalPrice(cartItems)}",
                            textScaleFactor: 1,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
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
            CustomSizedBox(
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
                    children: <Widget>[
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
                                children: <DeliveryDetailsTile>[
                                  DeliveryDetailsTile(
                                    title: 'Name: ',
                                    details: AppValues.name,
                                  ),
                                  DeliveryDetailsTile(
                                    title: 'Phone: ',
                                    details: AppValues.phoneNumber,
                                  ),
                                  DeliveryDetailsTile(
                                    title: 'Address: ',
                                    details: AppValues.homeAddress,
                                  ),
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
              child: CustomSizedBox(
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
                        CustomElevatedButton(
                          elevation: 0,
                          fontSize: width > 390 ? 19 : 15,
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
                        const CustomSizedBox(heightRatio: 0.03),
                        CustomElevatedButton(
                          elevation: 5,
                          fontSize: width > 390 ? 19 : 15,
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
