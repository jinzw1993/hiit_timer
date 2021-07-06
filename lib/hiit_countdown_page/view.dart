import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naive_lib/flutter_naive_lib.dart';
import 'package:hiit_timer/reoute/screen_arguments.dart';

import 'cubit.dart';
import 'state.dart';

class HiitCountdownPagePage extends StatefulWidget {
  const HiitCountdownPagePage({Key? key}) : super(key: key);

  @override
  _HiitCountdownPagePageState createState() => _HiitCountdownPagePageState();
}

class _HiitCountdownPagePageState extends ErisedState<HiitCountdownPagePage> {
  late HiitCountdownPageCubit cubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  void back() {
    Navigator.of(context).pop();
  }

  @override
  Widget buildBody() {
    var map =
        (ModalRoute.of(context)!.settings.arguments as ScreenArguments).map;
    cubit = HiitCountdownPageCubit.you(HiitCountdownPageState()
      ..exerciseCountdownSecond = map["currentExerciseInterval"]
      ..restCountdownSecond = map["currentRestInterval"]
      ..settingExerciseCountdownSecond = map["currentExerciseInterval"]
      ..settingRestCountdownSecond = map["currentRestInterval"]
      ..frequency = map["totalTimes"] - 1
      ..runType = 1
      ..runState = 1);

    return BlocProvider(
      create: (context) => cubit..startExerciseCountdown(),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
            child: BlocBuilder<HiitCountdownPageCubit, HiitCountdownPageState>(
              builder: (context, state) {
                if (state.runType == 1) {
                  switch (state.runState) {
                    case 1:
                      {
                        BlocProvider.of<HiitCountdownPageCubit>(context)
                            .settingRunState(2);
                        return Container(
                          color: Colors.red,
                          height: 100,
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Center(
                            child: Text(
                              "开始!",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 50),
                            ),
                          ),
                        );
                      }
                      break;
                    case 2:
                      {
                        sleep(Duration(seconds: 1));
                        if (state.exerciseCountdownSecond == 0) {
                          BlocProvider.of<HiitCountdownPageCubit>(context)
                              .settingRunState(3);
                        }
                        return Container(
                          color: Colors.red,
                          height: 100,
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Center(
                            child: Text(
                              "${state.exerciseInterval}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 50),
                            ),
                          ),
                        );
                      }
                      break;
                    case 3:
                      {
                        BlocProvider.of<HiitCountdownPageCubit>(context)
                            .settingRunState(4);

                        return Container(
                          color: Colors.red,
                          height: 100,
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Center(
                            child: Text(
                              "完成!",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 50),
                            ),
                          ),
                        );
                      }
                      break;
                    case 4:
                      {
                        sleep(Duration(seconds: 1));
                        BlocProvider.of<HiitCountdownPageCubit>(context)
                            .startRestCountdown();

                        return Container(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "运动间隔：",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(child: BlocBuilder<
                                        HiitCountdownPageCubit,
                                        HiitCountdownPageState>(
                                      builder: (context, state) {
                                        return Text(
                                            "${state.settingExerciseInterval}",
                                            style: TextStyle(
                                                color: Colors.grey[700]!,
                                                fontSize: 50));
                                      },
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      break;
                    default:
                      {
                        return Container(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "运动间隔：",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(child: BlocBuilder<
                                        HiitCountdownPageCubit,
                                        HiitCountdownPageState>(
                                      builder: (context, state) {
                                        return Text(
                                            "${state.settingExerciseInterval}",
                                            style: TextStyle(
                                                color: Colors.grey[700]!,
                                                fontSize: 50));
                                      },
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      break;
                  }
                }

                return Container(
                  padding: EdgeInsets.only(top: 10, left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "运动间隔：",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(child: BlocBuilder<HiitCountdownPageCubit,
                                HiitCountdownPageState>(
                              builder: (context, state) {
                                return Text("${state.settingExerciseInterval}",
                                    style: TextStyle(
                                        color: Colors.grey[700]!,
                                        fontSize: 50));
                              },
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
            child: BlocBuilder<HiitCountdownPageCubit, HiitCountdownPageState>(
              builder: (context, state) {
                if (state.runType == 2) {
                  switch (state.runState) {
                    case 1:
                      {
                        BlocProvider.of<HiitCountdownPageCubit>(context)
                            .settingRunState(2);
                        return Container(
                          color: Colors.teal[100],
                          height: 100,
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Center(
                            child: Text(
                              "开始!",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 50),
                            ),
                          ),
                        );
                      }
                      break;
                    case 2:
                      {
                        sleep(Duration(seconds: 1));
                        if (state.restCountdownSecond == 0) {
                          BlocProvider.of<HiitCountdownPageCubit>(context)
                              .settingRunState(3);
                        }
                        return Container(
                          color: Colors.teal[100],
                          height: 100,
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Center(
                            child: Text(
                              "${state.restInterval}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 50),
                            ),
                          ),
                        );
                      }
                      break;
                    case 3:
                      {
                        BlocProvider.of<HiitCountdownPageCubit>(context)
                            .settingRunState(4);
                        return Container(
                          color: Colors.teal[100],
                          height: 100,
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Center(
                            child: Text(
                              "完成!",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 50),
                            ),
                          ),
                        );
                      }
                      break;
                    case 4:
                      {
                        if (state.frequency != 0) {
                          BlocProvider.of<HiitCountdownPageCubit>(context)
                              .minusFrequency();
                          BlocProvider.of<HiitCountdownPageCubit>(context)
                              .startExerciseCountdown();
                        }
                        sleep(Duration(seconds: 1));
                        // BlocProvider.of<HiitCountdownPageCubit>(context)
                        //     .settingRunState(1);
                        return Container(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "休息间隔：",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(child: BlocBuilder<
                                        HiitCountdownPageCubit,
                                        HiitCountdownPageState>(
                                      builder: (context, state) {
                                        return Text(
                                            "${state.settingRestCountdownInterval}",
                                            style: TextStyle(
                                                color: Colors.grey[700]!,
                                                fontSize: 50));
                                      },
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      break;
                    default:
                      {
                        return Container(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "休息间隔：",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(child: BlocBuilder<
                                        HiitCountdownPageCubit,
                                        HiitCountdownPageState>(
                                      builder: (context, state) {
                                        return Text(
                                            "${state.settingRestCountdownInterval}",
                                            style: TextStyle(
                                                color: Colors.grey[700]!,
                                                fontSize: 50));
                                      },
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      break;
                  }
                }
                return Container(
                  padding: EdgeInsets.only(top: 10, left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "休息间隔：",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(child: BlocBuilder<HiitCountdownPageCubit,
                                HiitCountdownPageState>(
                              builder: (context, state) {
                                return Text(
                                    "${state.settingRestCountdownInterval}",
                                    style: TextStyle(
                                        color: Colors.grey[700]!,
                                        fontSize: 50));
                              },
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          BlocBuilder<HiitCountdownPageCubit, HiitCountdownPageState>(
            builder: (context, state) {
              return Container(
                color: Colors.yellow[50]!,
                height: 80,
                width: double.infinity,
                margin: EdgeInsets.only(top: 30, left: 10),
                child: Center(
                    child: Text(
                  "${state.frequency}",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]!),
                )),
              );
            },
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 30, left: 10),
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    // backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(41)),
                )),
                child: Text("取消",
                    style: TextStyle(fontSize: 10, color: Colors.black))),
          )
        ]),
      ),
    );
  }

  @override
  String title() {
    return "HIIT";
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }
}

//
// class HiitCountdownPagePage extends StatelessWidget {
//   final cubit = HiitCountdownPageCubit();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => cubit,
//       child: Container(),
//     );
//   }
// }
