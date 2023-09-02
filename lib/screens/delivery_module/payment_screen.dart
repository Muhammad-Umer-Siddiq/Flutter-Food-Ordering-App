import '../../utilities/imports.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool _anyOneSelected = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        titleTextStyle: const TextStyle(fontSize: 22, color: Colors.black),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(11),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const CustomSizedBox(heightRatio: 0.03),
            Expanded(
              flex: 0,
              child: CustomSizedBox(
                widthRatio: 1,
                heightRatio: 0.038,
                child: HeaderText(
                  'Choose Your Payment Method',
                  textAlign: width > 480 ? TextAlign.center : TextAlign.start,
                  fontSize: 23,
                ),
              ),
            ),
            const CustomSizedBox(heightRatio: 0.03),
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
                          isSelected: () => setState(() {
                            AppValues.showError = false;
                            DeliveryProcessHelpers.selectPaymentTypes(index);
                            DeliveryProcessHelpers.unselectArrivalPayment();
                            _anyOneSelected = true;
                          }),
                        )),
              ),
            ),
            const CustomSizedBox(heightRatio: 0.05),
            CustomCard(
              height: 50,
              elevation: 10,
              contentPadding: const EdgeInsets.only(left: 9),
              contentWidget: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                    value: AppValues.shouldPayOnArrival,
                    onChanged: (value) {
                      setState(() {
                        DeliveryProcessHelpers.selectArrivalPayment();
                        DeliveryProcessHelpers.unselectPaymentTypes();
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
            const Flexible(child: CustomSizedBox()),
            _anyOneSelected
                ? CustomElevatedButton(
                    buttonText: 'Add payment details',
                    buttonPress: () {
                      if (!AppValues.showError) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PaymentEnterDetailsScreen(),
                            ));
                      }
                    },
                  )
                : CustomElevatedButton(
                    buttonText: 'Complete Order',
                    buttonPress: () {
                      if (!AppValues.showError) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrderPlacedScreen(),
                            ));
                        setState(() {
                          DeliveryProcessHelpers.setEverythingDefault();
                        });
                        // Once user order completed
                      }
                    },
                  ),
            const Flexible(child: CustomSizedBox(heightRatio: 0.02)),
            _anyOneSelected || AppValues.shouldPayOnArrival
                ? const Flexible(child: Text(''))
                : const Flexible(
                    child: CustomSizedBox(
                      widthRatio: 1,
                      heightRatio: 0.03,
                      child: Text(
                        'Choose one of the payment methods to proceed',
                        textScaleFactor: 1,
                        maxLines: 1,
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
