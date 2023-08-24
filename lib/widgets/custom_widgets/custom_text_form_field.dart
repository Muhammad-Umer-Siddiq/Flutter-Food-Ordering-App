import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String? labelText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final int? maxLength;
  final String? hintText;
  final TextEditingController? controller;
  final num? fieldWidth;
  final InputBorder? simpleBorder;
  final InputBorder? errorBorder;
  final bool? enabled;
  final Widget? prefixIcon;
  final num? fieldHeight;
  final double? elevation;
  final bool haveCard;
  final Color? textColor;
  final FormFieldValidator<String>? validator;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? floatingLabelStyle;
  const MyTextFormField({
    super.key,
    this.labelText,
    this.keyboardType,
    this.suffixIcon,
    this.maxLength,
    this.hintText,
    this.obscureText,
    this.controller,
    this.fieldWidth,
    this.simpleBorder,
    this.errorBorder,
    this.enabled,
    this.prefixIcon,
    this.elevation,
    this.fieldHeight,
    this.haveCard = false,
    this.textColor,
    this.validator,
    this.labelStyle,
    this.hintStyle,
    this.floatingLabelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 630),
      width: MediaQuery.sizeOf(context).width * (fieldWidth ?? 0.6),
      child: haveCard
          ? Card(
              color: Colors.white,
              surfaceTintColor: Colors.white,
              shadowColor: Colors.white,
              elevation: elevation ?? 0,
              child: TextFormField(
                controller: controller,
                enabled: enabled ?? true,
                obscureText: obscureText ?? false,
                obscuringCharacter: '*',
                cursorColor: Colors.white,
                maxLength: maxLength ?? 100,
                mouseCursor: MaterialStateMouseCursor.clickable,
                cursorHeight: 21,
                textAlignVertical: TextAlignVertical.center,
                validator: validator,
                style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: MediaQuery.textScaleFactorOf(context) * 19),
                keyboardType: keyboardType ?? TextInputType.text,
                decoration: InputDecoration(
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    prefixIcon: prefixIcon,
                    counterText: '',
                    hintText: hintText ?? '',
                    hintStyle: hintStyle ??
                        const TextStyle(color: Colors.white54, fontSize: 13),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: suffixIcon,
                    ),
                    errorStyle:
                        const TextStyle(color: Colors.red, fontSize: 13),
                    enabledBorder: simpleBorder ??
                        const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                    focusedBorder: simpleBorder ??
                        const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                    disabledBorder: simpleBorder ??
                        const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                    errorBorder: errorBorder ??
                        const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                    focusedErrorBorder: errorBorder ??
                        const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                    labelStyle: labelStyle ??
                        TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.textScaleFactorOf(context) * 16),
                    floatingLabelStyle: floatingLabelStyle ??
                        TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.textScaleFactorOf(context) * 16),
                    labelText: labelText ?? ""),
              ),
            )
          : TextFormField(
              controller: controller,
              enabled: enabled ?? true,
              obscureText: obscureText ?? false,
              obscuringCharacter: '*',
              cursorColor: Colors.white,
              maxLength: maxLength ?? 100,
              cursorHeight: 21,
              textAlignVertical: TextAlignVertical.center,
              validator: validator,
              style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: MediaQuery.textScaleFactorOf(context) * 19),
              keyboardType: keyboardType ?? TextInputType.text,
              decoration: InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  prefixIcon: prefixIcon,
                  counterText: '',
                  hintText: hintText ?? '',
                  hintStyle: hintStyle ??
                      const TextStyle(color: Colors.white54, fontSize: 13),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: suffixIcon,
                  ),
                  errorStyle: TextStyle(
                      color: Colors.red,
                      fontSize: MediaQuery.textScaleFactorOf(context) * 12.5),
                  enabledBorder: simpleBorder ??
                      const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                  focusedBorder: simpleBorder ??
                      const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                  disabledBorder: simpleBorder ??
                      const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                  errorBorder: errorBorder ??
                      const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                  focusedErrorBorder: errorBorder ??
                      const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                  labelStyle: labelStyle ??
                      TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.textScaleFactorOf(context) * 16),
                  floatingLabelStyle: floatingLabelStyle ??
                      TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.textScaleFactorOf(context) * 16),
                  labelText: labelText ?? ""),
            ),
    );
  }
}
