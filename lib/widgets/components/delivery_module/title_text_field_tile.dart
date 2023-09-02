import '../../../utilities/imports.dart';

class TitleTextField extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final TextInputType? keyboard;
  final int? maxLength;
  const TitleTextField({
    super.key,
    required this.title,
    this.controller,
    this.keyboard,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomSizedBox(
          widthRatio: 0.20,
          heightRatio: 0.04,
          child: Text(
            title!,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 19, color: Colors.black),
          ),
        ),
        CustomTextFormFiled(
          cursorColor: Colors.black26,
          maxLength: maxLength,
          haveCardField: true,
          keyboardType: keyboard ?? TextInputType.name,
          validator: (value) {
            if (value!.isNotEmpty && AppValues.useProfileForDelivery) {
              return null;
            } else {
              return 'Field required for delivery *';
            }
          },
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          elevation: 14,
          fieldWidth: 0.7,
          textColor: Colors.black,
          controller: controller,
          simpleBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
        ),
      ],
    );
  }
}
