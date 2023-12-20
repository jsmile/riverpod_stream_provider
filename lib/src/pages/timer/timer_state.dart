sealed class TimerState {
  final int duration;

  const TimerState(this.duration);
}

class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() {
    return 'TimerInitial( duration: $duration )';
  }
}

class TimerRunning extends TimerState {
  const TimerRunning(super.duration);

  @override
  String toString() {
    return 'TimerRunning( duration: $duration )';
  }
}

class TimerPause extends TimerState {
  const TimerPause(super.duration);

  @override
  String toString() {
    return 'TimerPause( duration: $duration )';
  }
}

class TimerFinish extends TimerState {
  const TimerFinish() : super(0);

  @override
  String toString() {
    return 'TimerFinish( )';
  }
}
