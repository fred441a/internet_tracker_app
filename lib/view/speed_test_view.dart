import 'package:flutter/material.dart';
import '../BLoC/speed_test_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpeedTestView extends StatelessWidget {
  const SpeedTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Speed test"),
      ),
      body: BlocProvider(
        create: (context) => SpeedTestCubit()..test(),
        child: const SpeedtestWidget(),
      ),
    );
  }
}

class SpeedtestWidget extends StatelessWidget {
  const SpeedtestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeedTestCubit, Map<String, dynamic>>(
        builder: (context, state) {
      print(state);
      if (state["download"] == null) {
        return Center(
          child: Image.asset("assets/loading.gif"),
        );
      } else {
        return Center(
            child: Column(
          children: [
            Text(
              "Download: ${state["download"].toStringAsFixed(2).toString()} Mbits \n Upload: ${state["upload"].toStringAsFixed(2).toString()} Mbits",
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<SpeedTestCubit>().restart();
                },
                child: Text("Test Again"))
          ],
        ));
      }
    });
  }
}
