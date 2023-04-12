import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsAPI {
  static final String key = dotenv.env['API_KEY']!;
  static const String country = "in";
  static const int pageSize = 25;
}
