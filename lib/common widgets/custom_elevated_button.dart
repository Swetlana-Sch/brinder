import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      this.color,
      this.borderRadius : 2.0,
      this.height : 50,
      this.onPressed,
      this.child})
      : super(key: key);

  final Widget? child;
  final Color? color;
  final double? borderRadius;
  final double? height;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(borderRadius!))),
        ),
          onPressed: onPressed,
          child: child),
    );
  }
}
