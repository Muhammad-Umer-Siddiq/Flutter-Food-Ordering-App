import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController? textController;
  final String? textLabel;
  final TextInputType? keyboard;
  const MyTextFormField({
    super.key,
    this.textController,
    this.textLabel,
    this.keyboard,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextFormField(
        cursorColor: Colors.white,
        cursorHeight: 21,
        textAlignVertical: TextAlignVertical.center,
        validator: (value) {
          if (value!.isEmpty) {
            return "This field cannot be empty";
          } else {
            return null;
          }
        },
        style: const TextStyle(color: Colors.white, fontSize: 19),
        keyboardType: keyboard ?? TextInputType.text,
        decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            labelStyle: const TextStyle(color: Colors.white),
            floatingLabelStyle:
                const TextStyle(color: Colors.white, fontSize: 20),
            labelText: textLabel ?? ""),
      ),
    );
  }
}
