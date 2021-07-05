import 'package:bloc/bloc.dart';

import 'state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(MainPageState().init());

  void init() {
    emit(state.init());
  }

  void settingIndex(int index){
    emit(state.clone()..currIndex=index);
  }
}
