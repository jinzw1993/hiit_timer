import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naive_lib/flutter_naive_lib.dart';

import 'cubit.dart';
import 'state.dart';

class LogPage extends StatefulWidget {
  const LogPage({Key? key}) : super(key: key);

  @override
  _LogPageState createState() => _LogPageState();
}

class _LogPageState extends ErisedState<LogPage> {
  @override
  Widget buildBody() {
    return Center(child: Text("训练日志"),);
  }

  @override
  String title() {
    return "训练日志";
  }
}

// class LogPage extends StatelessWidget {
//   final cubit = LogCubit();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => cubit,
//       child: Container(),
//     );
//   }
// }
