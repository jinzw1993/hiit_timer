import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naive_lib/flutter_naive_lib.dart';

import 'cubit.dart';
import 'state.dart';
class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends ErisedState<MorePage> {


  @override
  Widget buildBody() {
    return Center(child: Text("更多"),);
  }

  @override
  String title() {
   return "";
  }
}

