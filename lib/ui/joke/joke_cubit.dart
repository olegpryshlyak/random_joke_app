import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_joke_app/repository/models/joke.dart';
import 'package:random_joke_app/repository/providers/api_provider.dart';
import 'package:random_joke_app/ui/joke/joke_state.dart';

class JokeCubit extends Cubit<JokeState> {
  JokeCubit() : super(const JokeState(isLoading: false)) {
    loadJoke();
  }

  final ApiProvider _apiProvider = ApiProvider();

  Future<void> loadJoke() async {
    emit(const JokeState(isLoading: true));
    try {
      final Joke joke = await _apiProvider.getRandomJoke();
      emit(state.copyWith(isLoading: false, joke: joke));
    } on DioError catch (error) {
      emit(state.copyWith(isLoading: false, error: error.message));
    } catch (error) {
      emit(state.copyWith(isLoading: false, error: error.toString()));
    }
  }

  void setShowPunchline(bool value) =>
      emit(state.copyWith(showPunchline: value));
}
