import '../../../utilities/imports.dart';

class DeliveryDetailsTile extends StatelessWidget {
  final String details;
  final String title;
  const DeliveryDetailsTile(
      {super.key, required this.details, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomSizedBox(
          widthRatio: 0.2,
          heightRatio: 0.044,
          child: Text(
            title,
            textAlign: TextAlign.start,
            textScaleFactor: 1,
            maxLines: 1,
            style: const TextStyle(
                fontSize: 13.5,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ),
        Flexible(
          child: CustomSizedBox(
            heightRatio: 0.044,
            widthRatio: 0.65,
            child: Text(
              details,
              textScaleFactor: 1,
              style: const TextStyle(fontSize: 12.5, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
