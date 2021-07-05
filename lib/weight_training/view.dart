import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naive_lib/flutter_naive_lib.dart';

import 'cubit.dart';
import 'state.dart';

class WeightTrainingPage extends StatefulWidget {
  const WeightTrainingPage({Key? key}) : super(key: key);

  @override
  _WeightTrainingPageState createState() => _WeightTrainingPageState();
}

class _WeightTrainingPageState extends ErisedState<WeightTrainingPage> {


  @override
  Widget buildBody() {
   return Center(child: Text("自重dffdsdasfdsafdsaf训练"));
  }

  @override
  String title() {
  return "自重训练";

  }
}

// class WeightTrainingPage extends StatelessWidget {
//   final cubit = WeightTrainingCubit();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => cubit,
//       child: Container(),
//     );
//   }
// }
