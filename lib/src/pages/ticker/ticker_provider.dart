import 'package:flutter/material.dart';
import 'package:riverpod_stream_provider/src/utils/ansi_debug.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticker_provider.g.dart';

// final tickerProvider = StreamProvider<int>((ref) {  // 수동은 ref.keepAlive() 가 기본
//   ref.onDispose(() {
//     debugPrint(info('### TickerProvider disposed ###'));
//   });

//   return Stream.periodic(
//     const Duration(seconds: 1),
//     (t) {
//       return t + 1;
//     },
//   ).take(60);
// });

@riverpod // 자동은 autoDispose 가 기본
Stream<int> ticker(TickerRef ref) {
  ref.onDispose(() {
    debugPrint(info('### TickerProvider disposed ###'));
  });

  return Stream.periodic(
    const Duration(seconds: 1),
    (t) {
      return t + 1;
    },
  ).take(60);
}
