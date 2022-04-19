import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String url;
  final String url2;

  Network(this.url, this.url2);

  Future<dynamic> getJsonData() async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return "Failed to get data";
    }
  }

  Future<dynamic> getAirData() async {
    var response = await http.get(Uri.parse(url2 ));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return "Failed to get data";
    }
  }

}