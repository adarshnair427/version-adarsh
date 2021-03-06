import 'package:flutter/material.dart';
import 'package:khushi/res/custom_colors.dart';

class GradientButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const GradientButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: CustomColors.curious_blue,
      // color: Color(0xFF2BA7D5),
      padding: const EdgeInsets.all(
        0.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.0,
          ),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              8.0,
            ),
          ),
          gradient: LinearGradient(
            colors: [
              CustomColors.teal,
              Color(0x00FFFFFF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
