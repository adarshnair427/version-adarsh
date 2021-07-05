import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khushi/patients/bloc/patients_bloc.dart';

import 'appointments/bloc/appointments_bloc.dart';
import 'appointments/view/add_appointment.dart';
import 'appointments/view/appointments_view.dart';
import 'appointments/view/select_date_time.dart';
import 'appointments/view/select_patient.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _initialization = Firebase.initializeApp();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      // ignore: missing_return
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container(child: Text("Firebase went wrong"));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<AppointmentsBloc>(
                create: (BuildContext context) => AppointmentsBloc(),
              ),
              BlocProvider<PatientsBloc>(
                create: (BuildContext context) => PatientsBloc(),
              )
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Khushi',
              theme: ThemeData(
                textTheme: GoogleFonts.montserratTextTheme(
                  Theme.of(context).textTheme,
                ),
                primaryColor: const Color(0xff29a39d),
                accentColor: const Color(0xff29a39d),
              ),
              builder: (BuildContext context, Widget? widget) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaleFactor: 1,
                  ),
                  child: widget ?? Container(),
                );
              },
              routes: {
                AppointmentsView.routeName: (_) => AppointmentsView(),
                AddAppointmentForm.routeName: (_) => AddAppointmentForm(),
                SelectPatient.routeName: (_) => SelectPatient(),
                SelectDateTime.routeName: (_) => SelectDateTime(),
              },
              initialRoute: AppointmentsView.routeName,
              navigatorObservers: [
                FirebaseAnalyticsObserver(analytics: analytics),
              ],
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}
