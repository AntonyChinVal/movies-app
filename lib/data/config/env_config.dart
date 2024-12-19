import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';

  static Future<void> initialize() async {
    await dotenv.load();
  }
}
