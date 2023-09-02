import '../../utilities/imports.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? buttonPress;
  final String text;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final Color? textColor;
  final double? textSize;
  final Color? shadowColor;
  const CustomTextButton({
    super.key,
    this.buttonPress,
    required this.text,
    this.buttonColor,
    this.width,
    this.height,
    this.textColor,
    this.textSize,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 100,
      height: height,
      child: TextButton(
        key: key,
        style: TextButton.styleFrom(
            backgroundColor: buttonColor ?? AppColors.appThemeColor,
            elevation: 5,
            shadowColor: shadowColor ?? Colors.black),
        onPressed: buttonPress,
        child: Text(
          text,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
              color: textColor ?? Colors.white, fontSize: textSize ?? 17),
        ),
      ),
    );
  }
}
