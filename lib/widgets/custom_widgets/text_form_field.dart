import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String? labelText;
  final String? helperText;
  final TextStyle? helperTextStyle;
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
  final bool haveCardField;
  final Color? textColor;
  final FormFieldValidator<String>? validator;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? floatingLabelStyle;
  final Color? cursorColor;
  final bool? readOnly;
  final VoidCallback? onTapField;
  const CustomTextFormFiled(
      {super.key,
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
      this.haveCardField = false,
      this.textColor,
      this.validator,
      this.labelStyle,
      this.hintStyle,
      this.floatingLabelStyle,
      this.cursorColor,
      this.onTapField,
      this.readOnly,
      this.helperText,
      this.helperTextStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 630),
      width: MediaQuery.sizeOf(context).width * (fieldWidth ?? 0.6),
      child: haveCardField
          ? Card(
              color: Colors.white,
              surfaceTintColor: Colors.white,
              shadowColor: Colors.white,
              elevation: elevation ?? 0,
              child: TextFormField(
                readOnly: readOnly ?? false,
                onTap: onTapField,
                controller: controller,
                enabled: enabled ?? true,
                obscureText: obscureText ?? false,
                obscuringCharacter: '*',
                cursorColor: cursorColor ?? Colors.white,
                maxLength: maxLength ?? 120,
                mouseCursor: MaterialStateMouseCursor.clickable,
                cursorHeight: 21,
                textAlignVertical: TextAlignVertical.center,
                validator: validator,
                style:
                    TextStyle(color: textColor ?? Colors.white, fontSize: 19),
                keyboardType: keyboardType ?? TextInputType.text,
                decoration: InputDecoration(
                    helperText: helperText,
                    helperMaxLines: 1,
                    helperStyle: helperTextStyle ??
                        const TextStyle(color: Colors.white70),
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
                        const TextStyle(color: Colors.white, fontSize: 16),
                    floatingLabelStyle: floatingLabelStyle ??
                        const TextStyle(color: Colors.white, fontSize: 16),
                    labelText: labelText ?? ""),
              ),
            )
          : TextFormField(
              readOnly: readOnly ?? false,
              onTap: onTapField,
              controller: controller,
              enabled: enabled ?? true,
              obscureText: obscureText ?? false,
              obscuringCharacter: '*',
              cursorColor: cursorColor ?? Colors.white,
              maxLength: maxLength ?? 120,
              cursorHeight: 21,
              textAlignVertical: TextAlignVertical.center,
              validator: validator,
              style: TextStyle(color: textColor ?? Colors.white, fontSize: 19),
              keyboardType: keyboardType ?? TextInputType.text,
              decoration: InputDecoration(
                  helperText: helperText,
                  helperStyle:
                      helperTextStyle ?? const TextStyle(color: Colors.white70),
                  helperMaxLines: 1,
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
                      const TextStyle(color: Colors.red, fontSize: 12.5),
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
                      const TextStyle(color: Colors.white, fontSize: 16),
                  floatingLabelStyle: floatingLabelStyle ??
                      const TextStyle(color: Colors.white, fontSize: 16),
                  labelText: labelText ?? ""),
            ),
    );
  }
}
