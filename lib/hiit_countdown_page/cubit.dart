import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hiit_timer/hiit/ticker.dart';

import 'state.dart';

class HiitCountdownPageCubit extends Cubit<HiitCountdownPageState> {
  Ticker? _exerciseTicker;
  Ticker? _restTicker;
  StreamSubscription<int>? _tickerSubscription;
  AudioCache audioCache = AudioCache();
  HiitCountdownPageCubit() : super(HiitCountdownPageState().init());
  HiitCountdownPageCubit.you(HiitCountdownPageState state) : super(state);
  void playDAudio() async{
    var a =await audioCache.play("water_drop.mp3");
  }
  void playCAudio() async{
    var a =await audioCache.play("coin.mp3");
  }
  void playFinishAudio() async{
    var a =await audioCache.play("over.mp3");
  }
  void startExerciseCountdown() {

    _tickerSubscription?.cancel();
    _exerciseTicker = Ticker();
    state.runState=2;
    _tickerSubscription = _exerciseTicker!.tick(ticks: state.settingExerciseCountdownSecond).listen((event) {
      playDAudio();
      emit(state.clone()..exerciseCountdownSecond = event..runType=1);
    });
  }

  void startRestCountdown() {
    _tickerSubscription?.cancel();
    _restTicker = Ticker();
    state.runState=1;
    _tickerSubscription = _restTicker!.tick(ticks:  state.settingRestCountdownSecond).listen((event) {
      playCAudio();
      emit(state.clone()..restCountdownSecond = event..runType=2);
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

  void settingRunState(int iState){
    emit(state.clone()..runState =iState);
  }

  void minusFrequency(){
    emit(state.clone()..frequency=state.frequency-1);
  }
}
