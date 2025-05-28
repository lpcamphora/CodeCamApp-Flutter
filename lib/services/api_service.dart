import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'http://SEU_BACKEND/validate';

  static Future<bool> validateCode(String code) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        body: {'code': code},
      );
      return response.statusCode == 200;
    } catch (e) {
      // Log do erro, poderia usar print, logger ou sentry
      print('Erro na validação do código: $e');
      return false;
    }
  }
}
