import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>> getSpeedData() async {
  //TODO make enviroment variables work.
  final String ip = String.fromEnvironment("IP");
  var request = http.Request('GET',
      Uri.parse('http://192.168.0.105/internet-tracker/GetSpeedTests.php'));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    return jsonDecode(await response.stream.bytesToString());
  }
  throw Exception("somthing went wrong:" + response.statusCode.toString());
}
