import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_stream_provider/src/pages/ticker/ticker_provider.dart';

import '../../utils/ansi_debug.dart';

class TickerPage extends ConsumerWidget {
  const TickerPage({super.key});

  String zeroPaddedTwoDigits(double ticks) {
    return ticks.floor().toString().padLeft(2, '0');
  }

  String formatTimer(int ticks) {
    final minutes = zeroPaddedTwoDigits(((ticks / 60) % 60));
    final seconds = zeroPaddedTwoDigits(ticks % 60);

    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickerValue = ref.watch(tickerProvider);
    debugPrint(success('### tickerValue: $tickerValue'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticker'),
      ),
      body: Center(
        child: tickerValue.when(
          data: (ticks) => Text(
            formatTimer(ticks),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          error: (err, st) {
            return Text(
              err.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            );
          },
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
