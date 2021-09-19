import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>> getSpeedData() async {
  print(bool.hasEnvironment("IP"));
  final String ip = String.fromEnvironment("IP");
  print("http://${ip}/internet-tracker/GetSpeedTests.php");
  var request = http.Request(
      'GET', Uri.parse('http://${ip}/internet-tracker/GetSpeedTests.php'));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    return jsonDecode(await response.stream.bytesToString());
  }
  throw Exception("somthing went wrong:" + response.statusCode.toString());
}
