import 'package:flutter/material.dart';
import '../BLoC/speed_tests_history_bloc.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartView extends StatelessWidget {
  ChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Speed Graph"),
      ),
      body: BlocBuilder<SpeedTestHistoryCubit, List<Map<String, dynamic>>>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ChartWidget(
              state: state,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/SpeedTest");
        },
        child: const Icon(Icons.speed),
      ),
    );
  }
}

class ChartWidget extends StatelessWidget {
  ChartWidget({Key? key, required this.state}) : super(key: key);
  List<Map<String, dynamic>> state;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Map<String, dynamic>, DateTime>> plotLines = [
      charts.Series(
        id: "Download(Mbits)",
        data: state,
        domainFn: (Map<String, dynamic> data, _) => data["time"],
        measureFn: (Map<String, dynamic> data, _) => data["download"],
      ),
      charts.Series(
        id: "Upload(Mbits)",
        data: state,
        domainFn: (Map<String, dynamic> data, _) => data["time"],
        measureFn: (Map<String, dynamic> data, _) => data["upload"],
      ),
    ];

    return charts.TimeSeriesChart(
      plotLines,
      behaviors: [charts.SeriesLegend()],
    );
  }
}
