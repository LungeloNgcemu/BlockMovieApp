import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String apiKey = dotenv.env['API_KEY']!;
}

class TMDBConstants {
  static String tmdbToken = dotenv.env['TMDB_TOKEN']!;
}

