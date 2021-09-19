import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/speed_test_data.dart';

class SpeedTestCubit extends Cubit<List<dynamic>> {
  SpeedTestCubit() : super([]);

  void init() async {
    emit(await getSpeedData());
  }
}
