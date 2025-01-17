import 'package:http/http.dart' as http;
// import 'dart:io' show Platform;

/// Clase que proporciona métodos para realizar solicitudes HTTP.
class HttpService {
  /// Método estático para enviar una solicitud POST al servidor.
  /// Toma un [body] como un mapa de tipo `<String, String>` que contiene los datos para la solicitud.
  /// Retorna un objeto `Future<http.Response>` que representa la respuesta de la solicitud HTTP.
  static Future<http.Response> postTest(Map<String, String> body) async {
    // Determina la dirección IP del servidor dependiendo de la plataforma (Android u otra).
    // final ip = Platform.isAndroid ? '192.168.1.36' : '192.168.1.36';
    // Realiza una solicitud HTTP POST a la URL de tu aplicación en Render.
    // La ruta de la solicitud es "/predict".
    return await http.post(
      // Uri.parse('http://$ip:5000/predict'),
      Uri.parse(
          'https://predihipertension-model-deployment.onrender.com/predict'),
      body: body,
    );
  }
}
