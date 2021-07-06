import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hiit_timer/hiit/ticker.dart';
import 'package:hiit_timer/hiit_countdown_page/view.dart';
import 'package:hiit_timer/reoute/screen_arguments.dart';

import 'state.dart';

class HiitCubit extends Cubit<HiitState> {
  late Ticker ticker;

  HiitCubit() : super(HiitState().init());

  void startCountdown() {
    ticker = Ticker();
    ticker.tick(ticks: 100).listen((event) {
      emit(state.clone()..countdownSecond = event);
    });
  }

  void settingTotalTimes(double times) {
    emit(state.clone()..totalTimes = times);
  }

  void settingCurrentExerciseIntervalMinute(int times) {
    emit(state.clone()..currentExerciseIntervalMinute = times);
  }

  void settingCurrentExerciseIntervalSecond(int times) {
    emit(state.clone()..currentExerciseIntervalSecond = times);
  }

  void settingCurrentRestIntervalMinute(int times) {
    emit(state.clone()..currentRestIntervalMinute = times);
  }

  void settingCurrentRestIntervalSecond(int times) {
    emit(state.clone()..currentRestIntervalSecond = times);
  }

  void settingExercisePicker() {
    emit(state.clone()..exerciseState = !state.exerciseState);
  }

  void settingRestStatePicker() {
    emit(state.clone()..restState = !state.restState);
  }

  void toCountDownPage(BuildContext context) {
    Navigator.pushNamed(context, "hiitCountdownPage",
        arguments: ScreenArguments({
          "currentExerciseInterval": state.currentExerciseInterval,
          "currentRestInterval": state.currentRestInterval,
          "totalTimes": state.totalTimes.toInt()
        }));
    // Navigator.push(context, MaterialPageRoute(builder: (context) => HiitCountdownPagePage()));
  }

  int getCurrentExerciseIntervalSecond() {
    return state.currentExerciseIntervalSecond;
  }
}
