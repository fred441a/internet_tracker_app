import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/speed_test_data.dart';

class SpeedTestCubit extends Cubit<List<Map<String, dynamic>>> {
  SpeedTestCubit() : super([]);

  void init() async {
    List<Map<String, dynamic>> emitList = [];
    List rawDataList = await getSpeedData();

    rawDataList.forEach((element) {
      double uploadMbits = int.parse(element["upload"]) / 1000000;
      double downloafMbits = int.parse(element["download"]) / 1000000;
      DateTime time = DateTime.parse(element["reg_date"]);

      emitList.add(
          {"upload": uploadMbits, "download": downloafMbits, "time": time});
    });

    emit(emitList);
  }
}
