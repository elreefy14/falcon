import 'dart:async';

import 'package:falcon/core/core_exports.dart';

part 'timer_event.dart';
part 'timer_state.dart';


class TimerBloc extends Bloc<TimerEvent, TimerState> {
  Timer? _timer; // Timer variable to handle countdown

  TimerBloc() : super(TimerInitial()) {
    // Load the saved time when initializing the Bloc
    _loadRemainingTime();

    on<StartTimer>((event, emit) {
      _timer?.cancel();
      _startTimer(event.duration, emit);
      emit(TimerRunning(event.duration));
    });

    on<UpdateTimer>((event, emit) {
      emit(TimerRunning(event.remainingTime));
    });

    on<StopTimer>((event, emit) {
      _timer?.cancel();
      emit(TimerStopped());
    });
  }

  void _startTimer(int duration, Emitter<TimerState> emit) {
    int remainingTime = duration;
    _saveRemainingTime(remainingTime); // Save the initial duration

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        remainingTime--;
        _saveRemainingTime(remainingTime); // Save the remaining time each second
        add(UpdateTimer(remainingTime));
      } else {
        add(StopTimer());
      }
    });
  }

  Future<void> _saveRemainingTime(int remainingTime) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('remainingTime', remainingTime); // Save remaining time
  }

  Future<void> _loadRemainingTime() async {
    final prefs = await SharedPreferences.getInstance();
    int remainingTime = prefs.getInt('remainingTime') ?? 0; // Load saved time
    if (remainingTime > 0) {
      add(StartTimer(remainingTime)); // Start timer if there is remaining time
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel(); // Cancel timer when Bloc is closed
    return super.close();
  }
}