import 'package:flutter/material.dart';
import 'package:food_ordering_app/utilities/colors.dart';

class MyElevatedButton extends StatelessWidget {
  final VoidCallback? buttonPress;
  final String buttonText;
  final Color? buttonColor;
  final num? buttonWidthRatio;
  final double? buttonHeightRatio;
  final double? fontSize;
  final Color? textCoLor;
  final double? elevation;
  final Color? borderColor;
  final AlignmentGeometry? textAlignment;
  final AlignmentGeometry? buttonAlignment;
  final EdgeInsetsGeometry? padding;
  final Color? surfaceTintColor;
  final double? maxWidth;
  final double? maxHeight;
  final double? minWidth;
  final double? minHeight;
  final Color? shadowColor;
  final Color? foregroundColor;
  final TextOverflow? textOverflow;
  final double? screenHeight;
  const MyElevatedButton({
    super.key,
    required this.buttonText,
    this.buttonPress,
    this.buttonColor,
    this.buttonHeightRatio,
    this.buttonWidthRatio,
    this.fontSize,
    this.textCoLor,
    this.elevation,
    this.borderColor,
    this.textAlignment,
    this.buttonAlignment,
    this.padding,
    this.surfaceTintColor,
    this.maxWidth,
    this.maxHeight,
    this.minWidth,
    this.minHeight,
    this.shadowColor,
    this.foregroundColor,
    this.textOverflow,
    this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: buttonAlignment ?? Alignment.center,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(3),
        child: Container(
          constraints: BoxConstraints(
            minWidth: minWidth ?? 90,
            minHeight: minHeight ?? 25,
            maxWidth: maxWidth ?? 450,

            maxHeight: maxHeight ?? 150,
            // button should stretch to a limit in case of screen size increasing
          ),
          width: MediaQuery.sizeOf(context).width * (buttonWidthRatio ?? 0.75),
          height:
              MediaQuery.sizeOf(context).height * (buttonHeightRatio ?? 0.06),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: shadowColor,
                foregroundColor: foregroundColor,
                surfaceTintColor: surfaceTintColor,
                alignment: textAlignment ?? Alignment.center,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side:
                        BorderSide(color: borderColor ?? Colors.red, width: 2)),
                elevation: elevation ?? 10,
                backgroundColor: buttonColor ?? AppColors().appThemeColor,
              ),
              onPressed: buttonPress,
              child: MediaQuery.sizeOf(context).height < (screenHeight ?? 400)
                  // to make button child responsive if screen height drops below 400
                  ? SizedBox(
                      height: MediaQuery.sizeOf(context).height * 1,
                      child: FittedBox(
                        child: Text(
                          buttonText,
                          textScaleFactor: 1,
                          overflow: textOverflow ?? TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: textCoLor ?? Colors.white,
                            fontSize: fontSize ?? 19,
                          ),
                        ),
                      ),
                    )
                  : Text(
                      buttonText,
                      textScaleFactor: 1,
                      maxLines: 1,
                      overflow: textOverflow ?? TextOverflow.ellipsis,
                      style: TextStyle(
                        color: textCoLor ?? Colors.white,
                        fontSize: fontSize ?? 19,
                      ),
                    )),
        ),
      ),
    );
  }
}
