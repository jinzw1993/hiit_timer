class HiitCountdownPageState {
  late int  exerciseCountdownSecond;
  late int  restCountdownSecond;
  late int  settingExerciseCountdownSecond;
  late int  settingRestCountdownSecond;
  /// 1 运动 2 休息
  late int runType ;
  /// 1 开始 2 运行 3 结束 4 闲时
  late int runState;
  /// 次数
  late int frequency;



  String get exerciseInterval{
    var minutesStr =
    (exerciseCountdownSecond/60).floor().toString().padLeft(2, '0');
    var  secondsStr = (exerciseCountdownSecond%60).floor().toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr";
  }
  String get settingExerciseInterval{
    var minutesStr =
    (settingExerciseCountdownSecond/60).floor().toString().padLeft(2, '0');
    var  secondsStr = (settingExerciseCountdownSecond%60).floor().toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr";
  }
  String get settingRestCountdownInterval{
    var minutesStr =
    (settingRestCountdownSecond/60).floor().toString().padLeft(2, '0');
    var  secondsStr = (settingRestCountdownSecond%60).floor().toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr";
  }

  String get restInterval{
    var minutesStr =
    (restCountdownSecond/60).floor().toString().padLeft(2, '0');
    var  secondsStr = (restCountdownSecond%60).floor().toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr";
  }
  HiitCountdownPageState init() {
    return HiitCountdownPageState()..exerciseCountdownSecond=2
    ..restCountdownSecond=2..runType=1..runState=1;
  }

  HiitCountdownPageState clone() {
    return HiitCountdownPageState()
      ..exerciseCountdownSecond = exerciseCountdownSecond
      ..restCountdownSecond = restCountdownSecond
      ..runType = runType
      ..settingExerciseCountdownSecond = settingExerciseCountdownSecond
      ..runState = runState
      ..frequency = frequency
      ..settingRestCountdownSecond = settingRestCountdownSecond
    ;
  }
}
