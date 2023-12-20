class Ticker {
  const Ticker();

  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (t) {
      return ticks - t - 1;
    }).take(ticks); // 매 1초마다 ticks 갯수 만큼 반환
  }
}
