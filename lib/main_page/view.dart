import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiit_timer/hiit/view.dart';
import 'package:hiit_timer/weight_training/view.dart';

import 'cubit.dart';
import 'state.dart';

class MainPage extends StatefulWidget {
  List<Widget> fragment = [WeightTrainingPage(), HiitPage()];

  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  MainPageCubit(),
      child: Scaffold(
        body: Center(
          child: Center(
            child: BlocBuilder<MainPageCubit, MainPageState>(
              builder: (context, state) {
                return IndexedStack(
                  children: widget.fragment,
                  index: state.currIndex,
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: BlocBuilder<MainPageCubit, MainPageState>(
          builder: (context, state) {
            return BottomNavigationBar(

              backgroundColor: Colors.black87,
              unselectedItemColor: Colors.black26,
              selectedItemColor: Colors.black,
              currentIndex: state.currIndex,
              onTap: (index) {
                BlocProvider.of<MainPageCubit>(context).settingIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.directions_run), label: "自重训练"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.fire_extinguisher), label: "HIIT"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_business_rounded), label: "训练日志"),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: "更多"),
              ],
            );
          },
        ),
      ),
    );
  }
}

// class MainPagePage extends StatelessWidget {
//   final cubit = MainPageCubit();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => cubit,
//       child: Container(),
//     );
//   }
// }
