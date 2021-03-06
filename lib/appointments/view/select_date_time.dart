import 'package:khushi/appointments/view/add_appointment.dart';
import 'package:khushi/res/custom_colors.dart';
import 'package:khushi/widgets/custom_app_bar.dart';
import 'package:khushi/widgets/custom_back_button.dart';
import 'package:khushi/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class SelectDateTime extends StatefulWidget {
  static const String routeName = '/selectDateTime';

  const SelectDateTime({Key? key}) : super(key: key);

  @override
  _SelectDateTimeState createState() => _SelectDateTimeState();
}

class _SelectDateTimeState extends State<SelectDateTime> {
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String period = DateFormat('a').format(DateTime.now());

  final _formKey = GlobalKey<FormState>();
  final hourController = TextEditingController();
  final minutesController = TextEditingController();

  late FocusNode hourFocusNode;
  late FocusNode minutesFocusNode;

  @override
  void initState() {
    _selectedDay = _focusedDay;
    hourFocusNode = FocusNode();
    minutesFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    hourFocusNode.dispose();
    minutesFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              leading: CustomBackButton(),
              title: Text(
                'Choose Date and Time',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2021),
              lastDay: DateTime.utc(2022),
              availableCalendarFormats: {
                CalendarFormat.month: 'Month',
              },
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // update `_focusedDay` here as well
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              calendarStyle: CalendarStyle(
                defaultTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                weekendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              calendarBuilders: CalendarBuilders(
                dowBuilder: (_, date) {
                  return Center(
                    child: Text(
                      DateFormat.E().format(date)[0],
                      style: TextStyle(
                        color: CustomColors.slate_gray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                selectedBuilder: (_, d1, d2) {
                  return Center(
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              CustomColors.teal,
                              CustomColors.curious_blue,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )),
                      child: Text(
                        d1.day.toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
                todayBuilder: (_, d1, d2) {
                  return Center(
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColors.light_gray,
                      ),
                      child: Text(
                        d1.day.toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
              headerStyle: HeaderStyle(
                titleCentered: true,
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                headerPadding: EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                leftChevronIcon: Icon(
                  Icons.arrow_back_ios,
                  color: CustomColors.teal,
                ),
                rightChevronIcon: Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.curious_blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
              ),
              child: Divider(
                color: CustomColors.light_athens_gray,
                thickness: 1,
              ),
            ),
            Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: FormField(
                builder: (state) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40.0,
                          child: TextFormField(
                            controller: hourController,
                            keyboardType: TextInputType.number,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            maxLength: 2,
                            textAlign: TextAlign.center,
                            focusNode: hourFocusNode,
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: 'hh',
                              errorStyle: TextStyle(
                                height: 0.0,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              state.didChange(
                                  '0' * (2 - hourController.text.length) +
                                      hourController.text +
                                      (minutesController.text.length == 0
                                          ? '99'
                                          : '0' + minutesController.text));
                              final hours = int.tryParse(value);
                              if (hours != null && hours > 1) {
                                hourFocusNode.unfocus();
                                minutesFocusNode.requestFocus();
                              }
                            },
                            validator: (value) {
                              final hours = int.tryParse(value ?? '');
                              if (hours == null || hours < 1 || hours > 12)
                                return '';
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Text(
                            ':',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40.0,
                          child: TextFormField(
                            controller: minutesController,
                            keyboardType: TextInputType.number,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            maxLength: 2,
                            textAlign: TextAlign.center,
                            focusNode: minutesFocusNode,
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: 'mm',
                              errorStyle: TextStyle(
                                height: 0.0,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              state.didChange(
                                  '0' * (2 - hourController.text.length) +
                                      hourController.text +
                                      (minutesController.text.length == 0
                                          ? '99'
                                          : '0' + minutesController.text));
                              if (value.length == 2) minutesFocusNode.unfocus();
                            },
                            validator: (value) {
                              final minutes = int.tryParse(value ?? '');
                              if (minutes == null ||
                                  minutes < 0 ||
                                  minutes > 59) return '';
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 16.0,
                                width: 32.0,
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      period = 'AM';
                                    });
                                  },
                                  style: ButtonStyle(
                                    visualDensity: VisualDensity.compact,
                                    minimumSize:
                                        MaterialStateProperty.all(Size.zero),
                                  ),
                                  child: Text(
                                    'AM',
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: period == 'AM'
                                          ? Colors.black
                                          : CustomColors.slate_gray,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16.0,
                                width: 32.0,
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      period = 'PM';
                                    });
                                  },
                                  style: ButtonStyle(
                                    visualDensity: VisualDensity.compact,
                                    minimumSize:
                                        MaterialStateProperty.all(Size.zero),
                                  ),
                                  child: Text(
                                    'PM',
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: period == 'PM'
                                          ? Colors.black
                                          : CustomColors.slate_gray,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    if (state.hasError)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        child: Text(
                          state.errorText!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                  ],
                ),
                validator: (String? value) {
                  final hours =
                      int.tryParse(value != null ? value.substring(0, 2) : ' ');
                  final minutes =
                      int.tryParse(value != null ? value.substring(2) : ' ');
                  if (hours == null || hours < 1 || hours > 12)
                    return 'Hours should range from 1 to 12';
                  if (minutes == null || minutes < 0 || minutes > 59)
                    return 'Minutes should range from 0 to 59';
                },
              ),
            ),
            Spacer(),
            Text(
              'Past appointments can also be added.',
              style: TextStyle(
                color: CustomColors.slate_gray,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                28.0,
                16.0,
                28.0,
                28.0,
              ),
              child: GradientButton(
                label: 'Continue',
                onPressed: () {
                  setState(() {
                    _autovalidateMode = AutovalidateMode.always;
                  });
                  if (_formKey.currentState!.validate())
                    Navigator.of(context)
                        .pushNamed(AddAppointmentForm.routeName, arguments: {
                      'patient': args['patient'],
                      'dateTime': DateTime(
                          _selectedDay!.year,
                          _selectedDay!.month,
                          _selectedDay!.day,
                          int.parse(hourController.text) +
                              (period == 'AM' ? 0 : 12),
                          int.parse(minutesController.text))
                    });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
