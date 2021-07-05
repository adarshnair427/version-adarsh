import 'package:khushi/screens/find_clinic.dart';

import '../res/custom_colors.dart';
import 'package:flutter/material.dart';
import 'enlist_clinic.dart';
import 'find_clinic.dart';
import '../widgets/raised_gradient_button.dart';

class ClinicSplash extends StatefulWidget {
  @override
  _ClinicSplashState createState() => _ClinicSplashState();
}

class _ClinicSplashState extends State<ClinicSplash> {
  _find() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => FindClinic()),
    );
  }

  _enlist() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => EnlistClinic()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(14),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,

                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              //flex: 4,
                              child: Row()),
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                                width: 0.9 * MediaQuery.of(context).size.width,
                                height: 60),
                            child: RaisedGradientButton(
                                child: Text(
                                  'Find Your Clinic',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    CustomColors.cyan,
                                    CustomColors.cyan_dark
                                  ],
                                ),
                                onPressed: () {
                                  _find();
                                  print('button clicked');
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Text(
                              'or',
                              style: TextStyle(
                                color: CustomColors.grey,
                                fontSize: 22,
                              ),
                              //overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                                width: 0.9 * MediaQuery.of(context).size.width,
                                height: 60),
                            child: RaisedGradientButton(
                              child: Text(
                                'Enlist Your Clinic',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.teal,
                                  fontSize: 18,
                                ),
                              ),
                              gradient: LinearGradient(
                                colors: <Color>[Colors.white, Colors.white],
                              ),
                              onPressed: () {
                                print('button clicked');
                                _enlist();
                              },
                              borderColor: CustomColors.teal,
                            ),
                          ),
                          Expanded(
                              //flex: 4,
                              child: Row()),
                        ],
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
