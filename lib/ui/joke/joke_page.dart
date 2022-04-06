import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_joke_app/repository/models/joke.dart';
import 'package:random_joke_app/ui/joke/joke_cubit.dart';
import 'package:random_joke_app/ui/joke/joke_state.dart';
import 'package:random_joke_app/ui/widgets/error_widget.dart';
import 'package:random_joke_app/ui/widgets/loading_widget.dart';

class JokePage extends StatefulWidget {
  const JokePage({Key? key}) : super(key: key);

  @override
  State<JokePage> createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  late JokeCubit _cubit;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _cubit = JokeCubit();
  }

  @override
  void dispose() {
    super.dispose();

    _timer?.cancel();
    _cubit.close();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _cubit.loadJoke();
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Make ma laugh')),
      body: BlocBuilder<JokeCubit, JokeState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state.isLoading) {
            return const LoadingWidget();
          } else if (state.joke != null) {
            return _BodyWidget(
              joke: state.joke!,
              onJokeTap: () {
                _cubit.setShowPunchline(true);
                _startTimer();
              },
              showPunchline: state.showPunchline,
            );
          } else {
            return AppErrorWidget(
              error: state.error ?? '',
              onRetry: _cubit.loadJoke,
            );
          }
        },
      ),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({
    required this.joke,
    required this.onJokeTap,
    required this.showPunchline,
  });

  final Joke joke;
  final Function() onJokeTap;
  final bool showPunchline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text(
                joke.setup,
                textAlign: TextAlign.center,
              ),
              onPressed: onJokeTap,
            ),
            const SizedBox(height: 20),
            if (showPunchline) Text(joke.punchline),
          ],
        ),
      ),
    );
  }
}
