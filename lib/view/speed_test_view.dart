import 'package:flutter/material.dart';
import '../BLoC//speed_test_bloc.dart';
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
        child: Container(),
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
      if (state == {}) {
        return Image.asset("assets/loading.gif");
      }
      return Center(
        child: Row(
          children: [
            Text("Download: ${state["download"]}"),
            Text("Upload: ${state["upload"]}")
          ],
        ),
      );
    });
  }
}
