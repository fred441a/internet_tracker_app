import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getSpeedData() async {
  //TODO make enviroment variables work.
  final String ip = String.fromEnvironment("IP");
  var request = http.Request('GET',
      Uri.parse( Uri.base.toString().replaceAll("/#/", "") + '/internet-tracker/GetSpeedTests.php'));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    return jsonDecode(await response.stream.bytesToString());
  }
  throw Exception("somthing went wrong:" + response.statusCode.toString());
}
