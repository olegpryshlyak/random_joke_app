import 'package:equatable/equatable.dart';
import 'package:random_joke_app/repository/models/joke.dart';

class JokeState extends Equatable {
  const JokeState({
    required this.isLoading,
    this.joke,
    this.error,
    this.showPunchline = false,
  });

  final bool isLoading;
  final Joke? joke;
  final String? error;
  final bool showPunchline;

  @override
  List<Object?> get props => [
        isLoading,
        joke,
        error,
        showPunchline,
      ];

  JokeState copyWith({
    bool? isLoading,
    Joke? joke,
    String? error,
    bool? showPunchline,
  }) {
    return JokeState(
      isLoading: isLoading ?? this.isLoading,
      joke: joke ?? this.joke,
      error: error ?? this.error,
      showPunchline: showPunchline ?? this.showPunchline,
    );
  }
}
