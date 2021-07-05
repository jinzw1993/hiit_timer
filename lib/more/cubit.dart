import 'package:bloc/bloc.dart';

import 'state.dart';

class MoreCubit extends Cubit<MoreState> {
  MoreCubit() : super(MoreState().init());
}
