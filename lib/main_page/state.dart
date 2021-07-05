class MainPageState {
  late int currIndex;
  MainPageState init() {
    return MainPageState()..currIndex=0;
  }

  MainPageState clone() {
    return MainPageState()..currIndex=currIndex;
  }
}
