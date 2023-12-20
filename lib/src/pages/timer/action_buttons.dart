import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'timer_provider.dart';
import 'timer_state.dart';

class ActionButtons extends ConsumerWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerStremNotiProvider);

    if (timerState is! AsyncData) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...switch (timerState.value!) {
          TimerInitial() => [
              FloatingActionButton(
                onPressed: () {
                  ref.read(timerStremNotiProvider.notifier).startTimer();
                },
                child: const Icon(Icons.play_arrow),
              ),
            ],
          TimerRunning() => [
              FloatingActionButton(
                onPressed: () {
                  ref.read(timerStremNotiProvider.notifier).pauseTimer();
                },
                child: const Icon(Icons.pause),
              ),
              FloatingActionButton(
                onPressed: () {
                  ref.read(timerStremNotiProvider.notifier).resetTimer();
                },
                child: const Icon(Icons.replay),
              ),
            ],
          TimerPause() => [
              FloatingActionButton(
                onPressed: () {
                  ref.read(timerStremNotiProvider.notifier).resumeTimer();
                },
                child: const Icon(Icons.play_arrow),
              ),
              FloatingActionButton(
                onPressed: () {
                  ref.read(timerStremNotiProvider.notifier).resetTimer();
                },
                child: const Icon(Icons.replay),
              ),
            ],
          TimerFinish() => [
              FloatingActionButton(
                onPressed: () {
                  ref.read(timerStremNotiProvider.notifier).resetTimer();
                },
                child: const Icon(Icons.replay),
              ),
            ],
        }
      ],
    );
  }
}
