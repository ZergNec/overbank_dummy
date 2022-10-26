import 'dart:convert';
import 'package:http/http.dart' as http;

class CallApi {
  final String _url = "http://138.201.6.194:8000/";
  //138.201.6.194:8000/api/web/index.php?r=auth/login

  Future<String> postData(data, apiUrl) async {
    //var fullUrl = _url + apiUrl;

//final httpsUri = Uri.https('example.com', 'api/fetch', {'limit': '10'});
//print(httpsUri); // https://example.com/api/fetch?limit=10

    //final fullUrl = Uri.parse(_url, 'api/web/index.php', {'r': '$apiUrl'});

//    print('url: ${fullUrl.toString()}');
    print('body: ${jsonEncode(data)}');
    print('headers: ${_setHeaders()}');

    final response = await http.post(
      //fullUrl, //Uri.parse(fullUrl),

      // this is ok
      Uri.parse('http://138.201.6.194:8000/api/web/index.php?r=$apiUrl'),
      body: jsonEncode(data),
      // this is ok

      headers: _setHeaders(),
    );
    print('Failed to post with status code: ${response.statusCode}');
    print('Body: ${response.body}');
    if (response.statusCode == 200) {
      //200 is an OK code
      return response.body;
    } else {
      return response.statusCode.toString();
      throw Exception(
          'Failed to post with status code: ${response.statusCode}');
    }
  }

  _setHeaders() => {
        'Content-Type': 'application/json',
        'accept': 'application/json',
      };
}
