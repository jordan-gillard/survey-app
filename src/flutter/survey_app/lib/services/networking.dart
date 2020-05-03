import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  var responseData;
  final String url;

  NetworkHelper(this.url, {this.responseData});

  Future getData() async {
    http.Response response = await http.get(this.url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future postData() async {
    http.Response response = await http.post(
      this.url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(responseData),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
