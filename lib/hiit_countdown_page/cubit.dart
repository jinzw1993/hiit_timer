import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hiit_timer/hiit/ticker.dart';

import 'state.dart';

class HiitCountdownPageCubit extends Cubit<HiitCountdownPageState> {
  Ticker? _exerciseTicker;
  Ticker? _restTicker;
  StreamSubscription<int>? _tickerSubscription;

  HiitCountdownPageCubit() : super(HiitCountdownPageState().init());
  HiitCountdownPageCubit.you(HiitCountdownPageState state) : super(state);

  void startExerciseCountdown() {
    _tickerSubscription?.cancel();
    _exerciseTicker = Ticker();
    _tickerSubscription = _exerciseTicker!.tick(ticks: 10).listen((event) {
      emit(state.clone()..exerciseCountdownSecond = event);
    });
  }

  void startRestCountdown() {
    _tickerSubscription?.cancel();
    _restTicker = Ticker();
    _tickerSubscription = _restTicker!.tick(ticks: 10).listen((event) {
      emit(state.clone()..restCountdownSecond = event);
    });
  }

  void settingRunType(int type){
    if(type==1){
      emit(state.clone()..runType = type);
    }else{
      emit(state.clone()..runType = type);
    }
  }

  void referExerciseSecond(){
    emit(state.clone()..exerciseCountdownSecond=10);
  }

  void referRestSecond(){
    emit(state.clone()..restCountdownSecond=10);
  }
}
