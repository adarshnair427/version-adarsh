import '../res/custom_colors.dart';
import 'package:flutter/material.dart';
import 'phone_login.dart';
import '../widgets/raised_gradient_button.dart';

class EnlistClinic extends StatefulWidget {
  @override
  _EnlistClinicState createState() => _EnlistClinicState();
}

class _EnlistClinicState extends State<EnlistClinic> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _name = "";
  String _city = "";
  String _locality = "";
  String _address = "";
  TimeOfDay? _openTime;
  TimeOfDay? _closeTime;
  TimeOfDay? _shiftStart;
  TimeOfDay? _shiftEnd;
  TextEditingController _controller1 = new TextEditingController(text: ' ');
  TextEditingController _controller2 = new TextEditingController(text: ' ');
  TextEditingController _controller3 = new TextEditingController(text: ' ');
  TextEditingController _controller4 = new TextEditingController(text: ' ');
  bool sametime = false;

  void _enlistClinic() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Enlist Clinic',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    //maxHeight: MediaQuery.of(context).size.height,
                    maxHeight: double.infinity,
                  ),
                  child: Form(
                    key: formKey,
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(4),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Name',
                                    style: TextStyle(
                                        color: CustomColors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: new BorderSide()),
                                  //labelText: 'Name'
                                ),
                                onChanged: (input) => _name = input,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(4),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'City',
                                    style: TextStyle(
                                        color: CustomColors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: new BorderSide()),
                                  //labelText: 'Name'
                                ),
                                onChanged: (input) => _city = input,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(4),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Street Address',
                                    style: TextStyle(
                                        color: CustomColors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: TextFormField(
                                keyboardType: TextInputType.streetAddress,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: new BorderSide()),
                                  //labelText: 'Name'
                                ),
                                onChanged: (input) => _address = input,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Clinic Open Time',
                                        style: TextStyle(
                                            color: CustomColors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Clinic Close Time',
                                        style: TextStyle(
                                            color: CustomColors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    _openTime = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                      builder: (BuildContext context,
                                          Widget? child) {
                                        return MediaQuery(
                                          data: MediaQuery.of(context).copyWith(
                                              alwaysUse24HourFormat: true),
                                          child: child!,
                                        );
                                      },
                                    );
                                    _controller1.text = _openTime!.format(context);
                                  },
                                  child: Container(
                                    width:
                                        0.3 * MediaQuery.of(context).size.width,
                                    child: TextFormField(
                                      controller: _controller1,
                                      enabled: false,
                                      //initialValue: "",
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    _closeTime = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                      builder: (BuildContext context,
                                          Widget? child) {
                                        return MediaQuery(
                                          data: MediaQuery.of(context).copyWith(
                                              alwaysUse24HourFormat: true),
                                          child: child!,
                                        );
                                      },
                                    );
                                    _controller2.text = _closeTime!.format(context);
                                  },
                                  child: Container(
                                    width:
                                        0.3 * MediaQuery.of(context).size.width,
                                    child: TextFormField(
                                      controller: _controller2,

                                      enabled: false,
                                      //initialValue: "",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Your Shift Start Time',
                                        style: TextStyle(
                                            color: CustomColors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Your Shift End Time',
                                        style: TextStyle(
                                            color: CustomColors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    if (sametime == false) {
                                      _shiftStart = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                        builder: (BuildContext context,
                                            Widget? child) {
                                          return MediaQuery(
                                            data: MediaQuery.of(context)
                                                .copyWith(
                                                    alwaysUse24HourFormat:
                                                        true),
                                            child: child!,
                                          );
                                        },
                                      );
                                      _controller3.text =
                                          _shiftStart!.format(context);
                                    }
                                  },
                                  child: Container(
                                    width:
                                        0.3 * MediaQuery.of(context).size.width,
                                    child: TextFormField(
                                      controller: _controller3,
                                      enabled: false,
                                      //initialValue: "",
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    if (sametime == false) {
                                      _shiftEnd = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                        builder: (BuildContext context,
                                            Widget? child) {
                                          return MediaQuery(
                                            data: MediaQuery.of(context)
                                                .copyWith(
                                                    alwaysUse24HourFormat:
                                                        true),
                                            child: child!,
                                          );
                                        },
                                      );
                                      _controller4.text =
                                          _shiftEnd!.format(context);
                                    }
                                  },
                                  child: Container(
                                    width:
                                        0.3 * MediaQuery.of(context).size.width,
                                    child: TextFormField(
                                      controller: _controller4,

                                      enabled: false,
                                      //initialValue: "",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Material(
                                  child: Checkbox(
                                    activeColor: CustomColors.black,
                                    value: sametime,
                                    onChanged: (value) {
                                      setState(() {
                                        sametime = value!;
                                        if (sametime == true) {
                                          _controller3.text = _controller1.text;
                                          _controller4.text = _controller2.text;
                                        }
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  'Same as Clinic timings',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: RaisedGradientButton(
                                  child: Text(
                                    'Enlist new Clinic',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      CustomColors.cyan,
                                      CustomColors.cyan_dark
                                    ],
                                  ),
                                  onPressed: () {
                                    _enlistClinic();
                                    print('button clicked');
                                  }),
                            )
                          ],
                        )
                      ],
                    ),
                  ))),
        ),
      ),
    );
  }
}
