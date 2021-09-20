import 'package:bloc/bloc.dart';
import '../data/single_speed_test.dart';

class SpeedTestCubit extends Cubit<Map<String, dynamic>> {
  SpeedTestCubit() : super({});

  void test() async {
    Map speedtest = await getSpeedTest();
    Map<String, dynamic> emitMap = {
      "download": speedtest["download"] / 1000000,
      "upload": speedtest["upload"] / 1000000,
      "time": DateTime.now()
    };
    emit(emitMap);
  }
}
