import 'package:bloc/bloc.dart';

import 'state.dart';

class LogCubit extends Cubit<LogState> {
  LogCubit() : super(LogState().init());
}
