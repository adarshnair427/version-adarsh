import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../res/custom_colors.dart';
import '../widgets/raised_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'email_login.dart';
import 'clinic_splash.dart';  
class PhoneLogin extends StatefulWidget{
  @override
  _PhoneLoginState createState() => _PhoneLoginState();

}

class _PhoneLoginState extends State<PhoneLogin>{
  final TextEditingController phoneNumberController = TextEditingController(
  
  );
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  bool? agree = false;

  // This function is triggered when the button is clicked
  void _sendOTP(){
    Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ClinicSplash()
        ),
      );
    // Do something
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                  "assets/homeImage.svg",
                  semanticsLabel: 'Acme Logo'
          ),
                  Text(
                    'Welcome to Khushi',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'Keep track of your patients info and consult with other doctors',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,

                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      print(number.phoneNumber);
                    },
                    onInputValidated: (bool value) {
                      print(value);
                    },
                    selectorConfig: SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    ),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle: TextStyle(color: CustomColors.black),
                    initialValue: number,
                    textFieldController: phoneNumberController,
                    formatInput: false,
                    keyboardType:
                        TextInputType.numberWithOptions(signed: true, decimal: true),
                    inputBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: CustomColors.teal)
                    ),
                    onSaved: (PhoneNumber number) {
                      print('On Saved: $number');
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => EmailLogin()
                            ),
                          );
                        },
                        child:Text(
                          'Use Email ID',
                        )
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment. end,
                children: [
                  CheckboxListTile(value: agree, onChanged: (value) {
                    setState(() {
                      agree = value;
                    });
                  },
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: CustomColors.black,
                    title: Text(
                      'Accept terms and conditions',
                      style: TextStyle(
                        fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Center(
                    child: RaisedGradientButton(
                      child: Text(
                        'Send OTP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      gradient: LinearGradient(
                        colors: <Color>[CustomColors.cyan, CustomColors.cyan_dark],
                      ),
                      onPressed: (){
                        _sendOTP();
                        print('button clicked');
                      }
                    ),
                  ),
                ],
              ),

            ],
          )
        ),
      ),
    );
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }
}