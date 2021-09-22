import 'package:flutter/material.dart';
import 'data/speed_test_data.dart';
import 'BLoC/speed_tests_history_bloc.dart';
import 'view/chart_view.dart';
import 'view/speed_test_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpeedTestHistoryCubit()..init(),
      child: MaterialApp(
        title: 'Internet  Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => ChartView(),
          "/SpeedTest": (context) => SpeedTestView()
        },
      ),
    );
  }
}
