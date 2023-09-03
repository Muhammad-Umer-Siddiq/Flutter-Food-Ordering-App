import '../../utilities/imports.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({super.key});

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  void _androidDialogAllow() {
    showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
              actions: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 19, color: Colors.red.shade900),
                  ),
                ),
                CustomTextButton(
                  text: 'Allow',
                  buttonPress: () {
                    setState(() {
                      AppValues.useProfileForDelivery = true;
                    });
                    Navigator.pop(context);
                  },
                )
              ],
              title: 'Address Not Specified',
              content:
                  "Fill the field/s or allow to use profile details for delivery",
            ));
  }

  void _dialogAddressNotGiven() {
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        title: 'Address Not Specified',
        content:
            'Fill the field as no details were provided during registration',
        actions: [
          CustomTextButton(
            text: 'Ok',
            buttonPress: () {
              setState(() => AppValues.useProfileForDelivery = false);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  void _iosDialogAllow() {
    showDialog(
        context: context,
        builder: (context) => CustomCupertinoAlertDialog(
              actions: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 19, color: Colors.red.shade900),
                  ),
                ),
                CustomTextButton(
                  text: 'Allow',
                  buttonPress: () {
                    setState(() {
                      AppValues.useProfileForDelivery = true;
                    });
                    Navigator.pop(context);
                  },
                )
              ],
              title: 'Address Not Specified',
              content:
                  "Fill the field/s or allow to use profile details for delivery",
            ));
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
        child: CustomSizedBox(
          widthRatio: 1,
          heightRatio: 1,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Enter delivery address",
                  style: TextStyle(fontSize: 22),
                ),
                const CustomSizedBox(heightRatio: 0.025),
                TitleTextField(
                  title: 'Name',
                  controller: AppConsts.nameControllerD,
                ),
                TitleTextField(
                  title: 'Address',
                  controller: AppConsts.addressControllerD,
                  keyboard: TextInputType.streetAddress,
                ),
                TitleTextField(
                  title: 'Phone',
                  maxLength: 11,
                  controller: AppConsts.phoneControllerD,
                  keyboard: TextInputType.phone,
                ),
                const CustomSizedBox(heightRatio: 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
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
                const CustomSizedBox(heightRatio: 0.035),
                CustomCard(
                  elevation: 8,
                  height: 70,
                  contentPadding: const EdgeInsets.all(8),
                  contentWidget: CheckboxListTile(
                    title: const Text(
                      'Use my profile details',
                      style: TextStyle(fontSize: 20),
                    ),
                    checkboxShape: const CircleBorder(
                      side: BorderSide(width: 1, strokeAlign: 4),
                    ),
                    side: const BorderSide(
                      color: Colors.redAccent,
                      width: 1.5,
                      style: BorderStyle.solid,
                      strokeAlign: 4,
                    ),
                    value: AppValues.useProfileForDelivery,
                    onChanged: (value) => setState(() {
                      AppValues.useProfileForDelivery =
                          !AppValues.useProfileForDelivery;
                    }),
                  ),
                ),
                const CustomSizedBox(heightRatio: 0.05),
                CustomElevatedButton(
                  elevation: 5,
                  buttonText: 'Proceed',
                  buttonPress: () {
                    if (DeliveryProcessHelpers.deliveryFieldsEmpty() == false ||
                        LoginHelpers.registerFieldsEmpty() == false) {
                      setState(() {
                        DeliveryProcessHelpers.newDetails();
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OrderSummaryScreen(),
                          ));
                    } else if (DeliveryProcessHelpers.deliveryFieldsEmpty() &&
                        AppValues.useProfileForDelivery == false &&
                        LoginHelpers.registerFieldsEmpty() == false) {
                      Platform.isIOS
                          ? _iosDialogAllow()
                          : _androidDialogAllow();
                    } else if (DeliveryProcessHelpers.deliveryFieldsEmpty() &&
                        LoginHelpers.registerFieldsEmpty() &&
                        AppValues.useProfileForDelivery == true) {
                      _dialogAddressNotGiven();
                    } else {
                      Navigator.pushReplacement(
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
