import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naive_lib/flutter_naive_lib.dart';
import 'package:numberpicker/numberpicker.dart';

import 'cubit.dart';
import 'state.dart';

class HiitPage extends StatefulWidget {
  const HiitPage({Key? key}) : super(key: key);

  @override
  _HiitPageState createState() => _HiitPageState();
}

double sliderValue = 1.0;

class _HiitPageState extends ErisedState<HiitPage> {
  @override
  Widget buildBody() {
    return BlocProvider(
      create: (context) => HiitCubit(),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1)),
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "运动间隔",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(child: BlocBuilder<HiitCubit, HiitState>(
                            builder: (context, state) {
                              return Text("${state.exerciseInterval}",
                                  style: TextStyle(
                                      color: Colors.grey[700]!, fontSize: 50));
                            },
                          )),
                          BlocBuilder<HiitCubit, HiitState>(
                            builder: (context, state) {
                              return TextButton(onPressed: () {
                                // context.read<HiitCubit>().settingRestStatePicker();
                                BlocProvider.of<HiitCubit>(context)
                                    .settingExercisePicker();
                              }, child: Text("修改"));
                            },
                          )
                        ],
                      ),
                    ),
                    Row(children: [
                      BlocBuilder<HiitCubit, HiitState>(
                        builder: (context, state) {
                          return Offstage(
                            offstage: state.exerciseState,
                            child: Row(
                              children: [
                                NumberPicker(
                                    minValue: 0,
                                    maxValue: 60,
                                    value: state.currentExerciseIntervalMinute,
                                    infiniteLoop: true,
                                    onChanged: (va) {
                                      BlocProvider.of<HiitCubit>(context)
                                          .settingCurrentExerciseIntervalMinute(
                                          va);
                                    }),
                                Text("分钟"),
                                NumberPicker(
                                    minValue: 1,
                                    maxValue: 59,
                                    infiniteLoop: true,
                                    value: state.currentExerciseIntervalSecond,
                                    onChanged: (va) {
                                      BlocProvider.of<HiitCubit>(context)
                                          .settingCurrentExerciseIntervalSecond(
                                          va);
                                    }),
                                Text("秒"),
                              ],
                            ),
                          );
                        },
                      )

                    ],)
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1)),
              child: Container(
                // height: 100,

                padding: EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "休息间隔",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(child: BlocBuilder<HiitCubit, HiitState>(
                            builder: (context, state) {
                              return Text("${state.restInterval}",
                                  style: TextStyle(
                                      color: Colors.grey[700]!, fontSize: 50));
                            },
                          )),
                          BlocBuilder<HiitCubit, HiitState>(
                            builder: (context, state) {
                              return TextButton(onPressed: () {
                                // context.read<HiitCubit>().settingRestStatePicker();
                                BlocProvider.of<HiitCubit>(context)
                                    .settingRestStatePicker();
                              }, child: Text("修改"));
                            },
                          )
                        ],
                      ),
                    ),
                    BlocBuilder<HiitCubit, HiitState>(
                      builder: (context, state) {
                        return Offstage(
                          offstage: state.restState,
                          child: Row(
                            children: [
                              NumberPicker(
                                  minValue: 0,
                                  maxValue: 60,
                                  value: state.currentRestIntervalMinute,
                                  infiniteLoop: true,
                                  onChanged: (va) {
                                    BlocProvider.of<HiitCubit>(context)
                                        .settingCurrentRestIntervalMinute(va);
                                  }),
                              Text("分钟"),
                              NumberPicker(
                                  minValue: 1,
                                  maxValue: 59,
                                  infiniteLoop: true,
                                  value: state.currentRestIntervalSecond,
                                  onChanged: (va) {
                                    BlocProvider.of<HiitCubit>(context)
                                        .settingCurrentRestIntervalSecond(va);
                                    print("$va");
                                  }),
                              Text("秒"),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<HiitCubit, HiitState>(
                      builder: (context, state) {
                        return Text("共计:${state.totalTimes.toInt()}次",
                            style: TextStyle(color: Colors.grey, fontSize: 10));
                      },
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 1,
                        thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 6),
                        overlayShape: RoundSliderOverlayShape(
                          //可继承SliderComponentShape自定义形状
                          overlayRadius: 2, //滑块外圈大小
                        ),
                      ),
                      child: BlocBuilder<HiitCubit, HiitState>(
                        builder: (context, state) {
                          return Slider(
                              value: state.totalTimes,
                              min: 1,
                              max: 100,
                              divisions: 99,
                              label: '${state.totalTimes.toInt()}',
                              onChanged: (value) {
                                setState(() {
                                  BlocProvider.of<HiitCubit>(context)
                                      .settingTotalTimes(value);
                                  print("$value");
                                });
                              });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1)),
            ),
            Row(
              children: [
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1)),
                    child: SizedBox(
                        height: 30,
                        child: TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: false,
                                  builder: (BuildContext context) {
                                    return ListView.builder(
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text('老孟$index'),
                                        );
                                      },
                                      itemExtent: 20,
                                      itemCount: 50,
                                    );
                                  });
                            },
                            child: Text("选择预设",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black))))),
                SizedBox(
                  height: 30,
                  child: TextButton(
                    onPressed: () {


                    },
                    child: Text(
                      "设为预设",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                width: double.infinity,
                height: 25,
                child: BlocBuilder<HiitCubit, HiitState>(
                  builder: (context, state) {
                    print("倒计时${state.countdownSecond}");
                    return ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<HiitCubit>(context).toCountDownPage(context);
                        },
                        style: ButtonStyle(
                          // backgroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(41)),
                            )),
                        child: Text("开始",
                            style: TextStyle(
                                fontSize: 10, color: Colors.black)));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  String title() {
    return "HIIT";
  }
}
//
// class HiitPage extends StatelessWidget {
//   final cubit = HiitCubit();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => cubit,
//       child: Container(),
//     );
//   }
// }
