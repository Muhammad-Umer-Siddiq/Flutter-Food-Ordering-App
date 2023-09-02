// ignore_for_file: must_be_immutable
import 'package:food_ordering_app/utilities/imports.dart';

class PaymentTitle extends StatelessWidget {
  final String? paymentIconURL;
  final VoidCallback? isSelected;
  final VoidCallback? onDoubleTap;
  bool? paymentSelected;
  PaymentTitle({
    super.key,
    this.onDoubleTap,
    this.isSelected,
    this.paymentSelected = false,
    required this.paymentIconURL,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key,
      onTap: isSelected,
      onDoubleTap: onDoubleTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.23,
        height: 90,
        constraints: const BoxConstraints(maxWidth: 120),
        decoration: paymentSelected!
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.red.shade300))
            : const BoxDecoration(),
        child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: CustomCard(
              cardColor: Colors.white,
              shadowColor: Colors.grey,
              surfaceTintColor: Colors.white,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.white)),
              elevation: paymentSelected! ? 12 : 4,
              contentWidget: Image.asset(
                paymentIconURL!,
                fit: BoxFit.contain,
                width: double.infinity,
                height: 78,
              ),
            )),
      ),
    );
  }
}
