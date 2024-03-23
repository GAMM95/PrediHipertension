import 'package:http/http.dart' as http;
import 'dart:io' show Platform;

class HttpService {
  static Future<http.Response> postTest(Map<String, String> body) async {
    final ip = Platform.isAndroid ? '192.168.1.12' : '192.168.1.12';
    return await http.post(
      Uri.parse('http://$ip:5000/predict'),
      body: body,
    );
    // final response = await http.post(
    //   // Uri.parse('http://10.0.2.2:5000/predict'),
    //   Uri.parse('http://127.0.0.1:5000/predict'),
    //   body: body,
    // );
  }
}
