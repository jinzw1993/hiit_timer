import 'package:bloc/bloc.dart';

import 'state.dart';

class WeightTrainingCubit extends Cubit<WeightTrainingState> {
  WeightTrainingCubit() : super(WeightTrainingState().init());
}
