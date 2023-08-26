import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/consts.dart';
import '../utilities/helpers.dart';
import '../utilities/values.dart';
import '../widgets/components/delivery process/title_text_field_tile.dart';
import '../widgets/custom widgets/elevated_button.dart';
import '../widgets/custom widgets/sized_box.dart';
import 'order_summary_screen.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({super.key});

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  void _showDialogAndroid() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Address Not Specified',
            textScaleFactor: 1,
            textAlign: TextAlign.center,
          ),
          titleTextStyle: const TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
          content: const Text(
            "Fill the field/s or allow to use profile details for delivery",
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
                "Cancel",
                style: TextStyle(fontSize: 19, color: Colors.red.shade900),
              ),
            ),
            SizedBox(
              width: 150,
              child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    setState(() {
                      useProfileForDelivery = true;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Allow",
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
        title: const Text('Address Not Specified',
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
              "Cancel",
              style: TextStyle(fontSize: 19, color: Colors.red.shade900),
            ),
          ),
          SizedBox(
            width: 150,
            child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  setState(() {
                    useProfileForDelivery = true;
                  });
                  Navigator.pop(context);
                },
                child: const Text(
                  "Allow",
                  textAlign: TextAlign.center,
                  textScaleFactor: 1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 19, color: Colors.white),
                )),
          )
        ],
        content: const Text(
            "Fill the field/s or allow to use profile details for delivery",
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deliver to"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        titleTextStyle: const TextStyle(fontSize: 26, color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: MySizedBox(
          widthRatio: 1,
          heightRatio: 1,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter delivery address",
                  style: TextStyle(fontSize: 22),
                ),
                const MySizedBox(heightRatio: 0.025),
                TitleTextField(
                  title: 'Name',
                  controller: nameControllerD,
                ),
                TitleTextField(
                  title: 'Street Address',
                  controller: streetControllerD,
                  keyboard: TextInputType.streetAddress,
                ),
                TitleTextField(
                  title: 'City',
                  controller: cityControllerD,
                ),
                TitleTextField(
                  title: 'Phone',
                  maxLength: 11,
                  controller: phoneControllerD,
                  keyboard: TextInputType.phone,
                ),
                const MySizedBox(heightRatio: 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      height: 3,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      "OR",
                      style: TextStyle(fontSize: 22),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      height: 3,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                const MySizedBox(heightRatio: 0.035),
                SizedBox(
                  height: 80,
                  child: Card(
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Use my profile details',
                            style: TextStyle(fontSize: 20),
                          ),
                          Checkbox(
                            autofocus: true,
                            value: useProfileForDelivery,
                            onChanged: (value) => setState(() {
                              useProfileForDelivery = !useProfileForDelivery;
                            }),
                            side: const BorderSide(
                              color: Colors.redAccent,
                              width: 1,
                              style: BorderStyle.solid,
                              strokeAlign: 4,
                            ),
                            shape: const CircleBorder(
                              side: BorderSide(width: 1, strokeAlign: 4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const MySizedBox(heightRatio: 0.05),
                MyElevatedButton(
                  buttonWidthRatio: 0.78,
                  buttonText: 'Proceed',
                  buttonPress: () {
                    if (areFieldsEmpty() == true &&
                        useProfileForDelivery == false) {
                      Platform.isIOS ? _showDialogIOS() : _showDialogAndroid();
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OrderSummaryScreen(),
                          ));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
