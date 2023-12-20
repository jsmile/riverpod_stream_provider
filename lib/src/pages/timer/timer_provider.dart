import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_stream_provider/src/pages/timer/ticker.dart';
import 'package:riverpod_stream_provider/src/pages/timer/timer_state.dart';

import '../../utils/ansi_debug.dart';

part 'timer_provider.g.dart';

@riverpod
class TimerStremNoti extends _$TimerStremNoti {
  // Notifier 에서는 public 불가, private 가능
  final int _duration = 10;
  final Ticker _ticker = const Ticker();
  StreamSubscription<int>?
      _tickerSubscription; // Stream 의 사용이 끝나면 dispose 를 위함.

  @override
  Stream<TimerState> build() {
    ref.onDispose(() {
      debugPrint(info('### TimerStremNoti disposed ###'));
      // dispose 시 동작 중인 subscription 이 있으면 cancel
      _tickerSubscription?.cancel();
    });

    debugPrint(info('### TimerStremNoti initial ###'));
    // Stream.value( ) 를 사용하면 AsyncLoading --> AsyncData 순으로 진행됨.
    return Stream.value(TimerInitial(_duration));
  }

  void startTimer() {
    // Timer 시작을 알리고
    debugPrint(success('### TimerStremNoti startTimer ###'));
    state = AsyncData(TimerRunning(_duration));

    // Stream 을 생성하고 listen 해서 stata 변화 시마다 Timer를 Running 시켜 emmit 함
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(ticks: _duration).listen((duration) {
      state = duration > 0
          ? AsyncData(TimerRunning(duration))
          : const AsyncData(TimerFinish());
    });
  }

  void pauseTimer() {
    switch (state.value!) {
      case TimerRunning(:int duration):
        debugPrint(success('### TimerStremNoti pause ###'));
        _tickerSubscription?.pause();
        state = AsyncData(TimerPause(duration));
        break;
      case _: // 나머지에서는 작동하지 않음
    }
  }

  void resumeTimer() {
    switch (state.value) {
      case TimerPause(:int duration):
        debugPrint(success('### TimerStremNoti resume ###'));
        _tickerSubscription?.resume();
        state = AsyncData(TimerRunning(duration));
        break;
      case _:
    }
  }

  void resetTimer() {
    debugPrint(success('### TimerStremNoti reset ###'));
    _tickerSubscription?.cancel();
    state = AsyncData(TimerInitial(_duration));
  }
}
