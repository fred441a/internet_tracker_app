import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/speed_test_data.dart';
import 'speed_test_bloc.dart';

class SpeedTestHistoryCubit extends Cubit<List<Map<String, dynamic>>> {
  late StreamSubscription speedTestSubscription;
  SpeedTestHistoryCubit() : super([]) {
    speedTestSubscription = SpeedTestCubit().stream.listen((state) {
      init();
    });
  }

  @override
  Future<void> close() {
    speedTestSubscription.cancel();
    return super.close();
  }

  void init() async {
    List<Map<String, dynamic>> emitList = [];
    List rawDataList = await getSpeedData();

    rawDataList.forEach((element) {
      double uploadMbits = int.parse(element["upload"]) / 1000000;
      double downloadMbits = int.parse(element["download"]) / 1000000;
      DateTime time = DateTime.parse(element["reg_date"]);

      emitList.add(
          {"upload": uploadMbits, "download": downloadMbits, "time": time});
    });

    emit(emitList);
  }
}
