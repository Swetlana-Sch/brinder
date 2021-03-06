import 'package:flutter/cupertino.dart';
import 'package:matching_cats/common_widgets/custom_elevated_button.dart';

class SignInButton extends CustomElevatedButton{
  SignInButton({
    String? text,
    Color? color,
    Color? textColor,
    VoidCallback? onPressed,
}) : super (
    child: Text(text!, style: TextStyle(color: textColor, fontSize: 15),),
    color: color,
    onPressed: onPressed,
  );
}