class HiitState {
  late int currentExerciseInterval;
  late int currentExerciseIntervalMinute;
  late int currentExerciseIntervalSecond;
  late int currentRestInterval;
  late int currentRestIntervalMinute;
  late int currentRestIntervalSecond;
  late int countdownSecond;
  late double totalTimes;
  late bool exerciseState;
  late bool restState;

  String get exerciseInterval{
    var minutesStr =
    currentExerciseIntervalMinute.floor().toString().padLeft(2, '0');
    var  secondsStr = currentExerciseIntervalSecond.floor().toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr";
  }
  String get restInterval{
    var minutesStr =
    currentRestIntervalMinute.floor().toString().padLeft(2, '0');
    var  secondsStr = currentRestIntervalSecond.floor().toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr";
  }
  HiitState init() {
    return HiitState()
      ..currentExerciseInterval = 0
      ..currentRestInterval = 0
      ..currentExerciseIntervalMinute = 0
      ..currentExerciseIntervalSecond = 1
      ..currentRestIntervalMinute = 0
      ..countdownSecond = 0
      ..currentRestIntervalSecond = 1
      ..exerciseState = true
      ..restState = true
      ..totalTimes = 1
    ;
  }

  HiitState clone() {
    return HiitState()
      ..currentExerciseInterval = currentExerciseInterval
      ..currentRestInterval = currentRestInterval
      ..exerciseState = exerciseState
      ..currentExerciseIntervalMinute = currentExerciseIntervalMinute
      ..currentExerciseIntervalSecond = currentExerciseIntervalSecond
      ..currentRestIntervalMinute = currentRestIntervalMinute
      ..countdownSecond = countdownSecond
      ..currentRestIntervalSecond = currentRestIntervalSecond
      ..restState = restState
      ..totalTimes = totalTimes
    ;
  }
}
