import 'package:flutter/material.dart';

import '../utilities/helpers.dart';
import '../utilities/lists.dart';
import '../utilities/values.dart';
import '../widgets/components/delivery_process/payment_tile.dart';
import '../widgets/components/main_food/header_text.dart';
import '../widgets/custom_widgets/custom_elevated_button.dart';
import '../widgets/custom_widgets/custom_sized_box.dart';
import 'order_placed_screen.dart';
import 'payment_type_details.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool _anyOneSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        titleTextStyle: const TextStyle(fontSize: 22, color: Colors.black),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MySizedBox(heightRatio: 0.05),
            const Expanded(
              flex: 0,
              child: MySizedBox(
                widthRatio: 1,
                heightRatio: 0.038,
                child: HeaderText(
                  'Choose Your Payment Method',
                  fontSize: 24,
                ),
              ),
            ),
            const MySizedBox(heightRatio: 0.03),
            SizedBox(
              height: 95,
              width: MediaQuery.sizeOf(context).width * 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                    paymentTypes.length,
                    (index) => PaymentTitle(
                          paymentIconURL: paymentTypes[index].paymentIconURL,
                          paymentSelected:
                              paymentTypes[index].paymentIsSelected,
                          isSelected: () {
                            setState(() {
                              showError = false;
                              DeliveryProcessHelpers()
                                  .selectPaymentTypes(index);
                              DeliveryProcessHelpers().unselectArrivalPayment();
                              _anyOneSelected = true;
                            });
                          },
                        )),
              ),
            ),
            const MySizedBox(heightRatio: 0.05),
            Card(
              elevation: 6,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              surfaceTintColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: shouldPayOnArrival,
                    onChanged: (value) {
                      setState(() {
                        DeliveryProcessHelpers().selectArrivalPayment();
                        DeliveryProcessHelpers().unselectPaymentTypes();
                        _anyOneSelected = false;
                      });
                    },
                  ),
                  const Text(
                    'Pay on Arrival',
                    textScaleFactor: 1,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text(
                "Pay with cash upon arrival",
                textScaleFactor: 1,
                style: TextStyle(fontSize: 15, color: Colors.green.shade800),
              ),
            ),
            const MySizedBox(heightRatio: 0.05),
            _anyOneSelected
                ? MyElevatedButton(
                    buttonText: 'Add payment details',
                    buttonPress: () {
                      if (!showError) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PaymentDetailsScreen(),
                            ));
                      }
                    },
                  )
                : MyElevatedButton(
                    buttonText: 'Complete Order',
                    buttonPress: () {
                      if (!showError) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrderPlacedScreen(),
                            ));
                      }
                    },
                  ),
            const MySizedBox(heightRatio: 0.02),
            _anyOneSelected || shouldPayOnArrival
                ? const Text('')
                : const Expanded(
                    flex: 0,
                    child: MySizedBox(
                      widthRatio: 1,
                      heightRatio: 0.03,
                      child: Text(
                        'Choose one of the payment methods to proceed',
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 15,
                            color: Colors.red),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
