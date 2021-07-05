import '../res/custom_colors.dart';
import 'package:flutter/material.dart';
import 'enlist_clinic.dart';

import '../widgets/raised_gradient_button.dart';
// https://stackoverflow.com/questions/49966980/how-to-create-toolbar-searchview-in-flutter
class FindClinic extends StatefulWidget {
  @override
  _FindClinicState createState() => _FindClinicState();
}

class _FindClinicState extends State<FindClinic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Find Clinic',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
