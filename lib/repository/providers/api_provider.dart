import 'package:dio/dio.dart';
import 'package:random_joke_app/repository/models/joke.dart';

class ApiProvider {
  static const _apiKey = 'QUtFhHPnlQ5f13LDVpQL3a54XgQzTlCJa1PMSB3o';
  static final _dio = Dio(
    BaseOptions(
      headers: {
        'x-api-key': _apiKey,
      },
    ),
  );

  Future<Joke> getRandomJoke() async {
    final result = await _dio.get('https://joke.api.gkamelo.xyz/random');
    return Joke.fromMap(result.data);
  }
}
