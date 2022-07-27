import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentConfig {
  static String get fileName {
    return ".env";
    // if (kReleaseMode) {}
    // return ".env.development";
  }

  static String get apiBase => dotenv.get("API_BASE");
  // static String get mediaApiBase => dotenv.get("MEDIA_API_BASE");
}
