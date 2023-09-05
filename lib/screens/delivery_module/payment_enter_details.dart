import '../../utilities/imports.dart';

class PaymentEnterDetailsScreen extends StatefulWidget {
  const PaymentEnterDetailsScreen({super.key});

  @override
  State<PaymentEnterDetailsScreen> createState() =>
      _PaymentEnterDetailsScreenState();
}

class _PaymentEnterDetailsScreenState extends State<PaymentEnterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const HeaderText(
              'Payment Details',
              fontSize: 30,
              textAlign: TextAlign.left,
            ),
            const CustomSizedBox(heightRatio: 0.15),
            const CustomTextFormFiled(
              cursorColor: Colors.black,
              labelText: 'Card Details',
              textColor: Colors.black,
              fieldWidth: 0.85,
              floatingLabelStyle: TextStyle(color: Colors.black),
              labelStyle: TextStyle(color: Colors.black),
              simpleBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
            const CustomSizedBox(heightRatio: 0.05),
            const CustomTextFormFiled(
              cursorColor: Colors.black,
              textColor: Colors.black,
              fieldWidth: 0.85,
              labelText: 'CVV',
              floatingLabelStyle: TextStyle(color: Colors.black),
              labelStyle: TextStyle(color: Colors.black),
              simpleBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
            ),
            const CustomSizedBox(heightRatio: 0.08),
            CustomElevatedButton(
              buttonText: 'Pay Now',
              buttonPress: () {
                setState(() {
                  DeliveryProcessHelpers.setEverythingDefault();
                });
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderPlacedScreen(),
                    ));
                // Once user order completed
              },
            )
          ],
        ),
      ),
    );
  }
}
