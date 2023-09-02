import 'package:flutter/cupertino.dart';

import '../../utilities/imports.dart';

class EachFoodDetailsScreen extends StatefulWidget {
  final PopularFoodModel? popularFoodItem; // for static data
  final Categories? categoriesFoodItem; // for dynamic data
  final bool isFoodInApi;

  const EachFoodDetailsScreen({
    super.key,
    required this.isFoodInApi,
    this.categoriesFoodItem,
    this.popularFoodItem,
  });

  @override
  State<EachFoodDetailsScreen> createState() => _EachFoodDetailsScreenState();
}

class _EachFoodDetailsScreenState extends State<EachFoodDetailsScreen> {
  void _showDialogAndroid() {
    showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
              title: 'Coming Soon!',
              content: "Soon you would be allow to order these food",
              actions: [
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FullMenuScreen(),
                      )),
                  child: Text(
                    "View Full Menu",
                    style: TextStyle(fontSize: 17, color: Colors.red.shade900),
                  ),
                ),
                CustomTextButton(
                  text: 'Ok',
                  buttonPress: () => Navigator.pop(context),
                )
              ],
            ));
  }

  void _showDialogIOS() {
    showDialog(
        context: context,
        builder: (context) => CustomCupertinoAlertDialog(
              title: 'Coming Soon',
              content: "Soon you would be allow to order these food",
              actions: [
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FullMenuScreen(),
                      )),
                  child: Text(
                    "View Full Menu",
                    style: TextStyle(fontSize: 17, color: Colors.red.shade900),
                  ),
                ),
                CustomTextButton(
                  text: 'Ok',
                  buttonPress: () => Navigator.pop(context),
                )
              ],
            ));
  }

  void _exceedLimit() => showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
          content: 'Your limit to order 30 times a specific food has reached',
          title: 'Limit Reach Error',
          actions: [
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(cartItems: cartItems),
                  )),
              child: Text(
                "View Cart",
                style: TextStyle(fontSize: 17, color: Colors.red.shade900),
              ),
            ),
            CustomTextButton(
              text: 'Ok',
              buttonPress: () => Navigator.pop(context),
            ),
          ],
        ),
      );

  void _exceedLimitIos() => showDialog(
        context: context,
        builder: (context) => CustomCupertinoAlertDialog(
          content: 'Your limit to order 30 times a specific food has reached',
          title: 'Limit Reach Error',
          actions: [
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(cartItems: cartItems),
                  )),
              child: Text(
                "View Cart",
                style: TextStyle(fontSize: 17, color: Colors.red.shade900),
              ),
            ),
            CustomTextButton(
              text: 'Ok',
              buttonPress: () => Navigator.pop(context),
            ),
          ],
        ),
      );

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    CartItemsHelpers.addToCart(widget.popularFoodItem!);
  }

  void _checkOrUncheck() => setState(() => widget.popularFoodItem!.extrasCheck =
      !widget.popularFoodItem!.extrasCheck);

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
                children: <Widget>[
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
                      child: CustomCard(
                        elevation: 15,
                        borderCurve: 30,
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 1,
                        contentWidget: Column(
                          children: <Widget>[
                            const CustomSizedBox(),
                            const CustomSizedBox(heightRatio: 0.02),
                            Text(
                              widget.categoriesFoodItem!.strCategory.toString(),
                              style: const TextStyle(
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            const CustomSizedBox(),
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
                            const CustomSizedBox(heightRatio: 0.03),
                            Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.height * 0.06,
                              color: Colors.grey.shade300,
                              alignment: Alignment.centerLeft,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Text(
                                  " Add some extras",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                            ),
                            const CustomSizedBox(heightRatio: 0.04),
                            CustomElevatedButton(
                              buttonColor: Colors.red.shade200,
                              borderColor: Colors.red.shade200,
                              buttonAlignment: Alignment.center,
                              buttonText: "Add to cart",
                              buttonPress: () {
                                Platform.isIOS
                                    ? _showDialogIOS()
                                    : _showDialogAndroid();
                              },
                              buttonWidthRatio: 0.8,
                              elevation: 0,
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
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Image.asset(
                      widget.popularFoodItem!.foodImageURL,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                      top: 220,
                      child: CustomCard(
                        elevation: 15,
                        borderCurve: 30,
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 1,
                        contentWidget: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const CustomSizedBox(),
                            Flexible(
                              child: Text(
                                widget.popularFoodItem!.foodName,
                                maxLines: 1,
                                textScaleFactor: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 31,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(
                                    child: Text(
                                      "Rs. ${widget.popularFoodItem!.foodPrice}",
                                      textScaleFactor: 1,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 28,
                                          color: Colors.red.shade900),
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.24,
                                    height: height * 0.1,
                                    constraints:
                                        const BoxConstraints(maxWidth: 155),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        // For minus
                                        GestureDetector(
                                          onTap: () => setState(() {
                                            if (widget.popularFoodItem!
                                                    .foodQuantity >
                                                1) {
                                              widget.popularFoodItem!
                                                  .foodQuantity--;
                                            }
                                          }),
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
                                            widget.popularFoodItem!.foodQuantity
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: widget
                                                            .popularFoodItem!
                                                            .foodQuantity ==
                                                        10
                                                    ? 23
                                                    : 24,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),

                                        // For plus
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (widget.popularFoodItem!
                                                      .foodQuantity <
                                                  30) {
                                                widget.popularFoodItem!
                                                    .foodQuantity++;
                                              }
                                            });
                                            widget.popularFoodItem!
                                                        .foodQuantity ==
                                                    30
                                                ? Platform.isIOS
                                                    ? _exceedLimitIos()
                                                    : _exceedLimit()
                                                : null;
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
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 8),
                              child: Text(
                                widget.popularFoodItem!.foodDescription,
                                textAlign: TextAlign.center,
                                textScaleFactor: 1,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 6,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            const CustomSizedBox(heightRatio: 0.02),
                            Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.height * 0.06,
                              color: Colors.grey.shade300,
                              alignment: Alignment.centerLeft,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Text(
                                  " Add some extras",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                            ),
                            const CustomSizedBox(heightRatio: 0.02),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: widget.popularFoodItem!.extrasCheck,
                                  onChanged: (value) {
                                    _checkOrUncheck();
                                  },
                                ),
                                Text(
                                  widget.popularFoodItem!.foodExtras,
                                  style: const TextStyle(fontSize: 17.5),
                                ),
                                const Expanded(
                                    flex: 8, child: SizedBox(width: 110)),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "Rs ${widget.popularFoodItem!.extrasPrice}",
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                            CustomElevatedButton(
                              buttonAlignment: Alignment.center,
                              buttonText: "Add to cart",
                              buttonPress: () {
                                setState(() {
                                  CartItemsHelpers.calculateTotalPrice(
                                      cartItems);
                                });
                                CartItemsHelpers.addToCart(
                                  widget.popularFoodItem!,
                                );

                                Navigator.pushReplacement(
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
