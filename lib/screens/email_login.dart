import '../res/custom_colors.dart';
import 'package:flutter/material.dart';
import 'phone_login.dart';
import 'clinic_splash.dart';
import '../widgets/raised_gradient_button.dart';
class EmailLogin extends StatefulWidget{
  @override
  _EmailLoginState createState() => _EmailLoginState();

}

class _EmailLoginState extends State<EmailLogin>{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  // String initialCountry = 'IN';
  // PhoneNumber number = PhoneNumber(isoCode: 'IN');

  bool? agree = false;

  // This function is triggered when the button is clicked
  void _signIn(){
    // Do something
    Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ClinicSplash()
        ),
      );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child:Form(
            key: formKey,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Flex(
                        // mainAxisSize: MainAxisSize.min,
                        direction: Axis.vertical,
                        children: [
                          Expanded(
                            // flex: 6,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Text(
                                    'Welcome to Khushi',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold 
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child:Text(
                                    'Keep track of your patients info and consult with other doctors',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.teal)
                                      ),
                                      labelText: 'Email'
                                    ),
                                    onChanged: (input) => _email = input,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: TextFormField(
                                    // keyboardType: TextInputType.,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.teal)
                                      ),
                                      labelText: 'Password'
                                    ),
                                    onChanged: (input) => _password = input,
                                    obscureText: true,
                                  ),
                                ),
                                
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) => PhoneLogin()
                                          ),
                                        );
                                      },
                                      child:Text(
                                        'Use Mobile No.',
                                        style: TextStyle(
                                          color: CustomColors.cyan,
                                          fontSize: 16,
                                        ),
                                      )
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                  crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Text(
                                            'Forgot Password?',
                                            style: TextStyle(
                                              color: CustomColors.grey,
                                              fontSize: 16,
                                            ),
                                            //overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Text(
                                            'Reset',
                                            style: TextStyle(
                                              color: CustomColors.cyan,
                                              fontSize: 17,
                                            ),
                                            //overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                    
                                    ],
                                  ),
                                Center(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints.tightFor(
                                      width: 0.9*MediaQuery.of(context).size.width,
                                      height: 50
                                    ),
                                    child: RaisedGradientButton(
                                      child: Text(
                                        'Log In',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      gradient: LinearGradient(
                                        colors: <Color>[CustomColors.cyan, CustomColors.cyan_dark],
                                      ),
                                      onPressed: (){
                                        print('button clicked');
                                      }
                                    ),
                                  ),
                                )
                                
                              ],
                            ),

                          ),
                        ],
                      ),
                    ),
                    
                  ],
                )
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }
}