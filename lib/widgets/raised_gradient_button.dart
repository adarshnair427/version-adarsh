import '../res/custom_colors.dart';
import 'package:flutter/material.dart';
class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function()? onPressed;
  final Color borderColor;

  const RaisedGradientButton({
    Key? key,
    required this.child,
    required this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    required this.onPressed,
    this.borderColor =  Colors.transparent
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 2,
          ),
        gradient: gradient,
        // boxShadow: [
        //   BoxShadow(
        //     offset: Offset(0.0, 0.5),
        //     blurRadius: 1.5,
        //   ),
        // ],
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}