import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naive_lib/flutter_naive_lib.dart';

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
    cubit =HiitCountdownPageCubit.you(HiitCountdownPageState()..exerciseCountdownSecond=10..restCountdownSecond=10..runType=1);
    super.initState();
  }
  @override
  Widget buildBody() {
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
                if(state.runType==1){
                  switch(state.runState){
                    case 1:{

                    }
                  }
                  if(state.runState==1){
                    return Container(
                      color: Colors.red,
                      height: 100,
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Center(child: Text("开始!",style: TextStyle(color: Colors.white,fontSize: 50),),),
                    );
                  }else{

                  }
                }




                if(state.exerciseCountdownSecond>0){
                  BlocProvider.of<HiitCountdownPageCubit>(context).referRestSecond();
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
                                  return Text("${state.exerciseInterval}",
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
                }else if(state.exerciseCountdownSecond==0&&state.runType==1){
                  if(state.runType==1){
                  BlocProvider.of<HiitCountdownPageCubit>(context).startRestCountdown();
                  BlocProvider.of<HiitCountdownPageCubit>(context).settingRunType(2);

                  }
                  return Container(
                    color: Colors.red,
                    height: 100,
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Center(child: Text("开始!",style: TextStyle(color: Colors.white,fontSize: 50),),),
                  );
                }else {
                  return Container(
                    color: Colors.red,
                    height: 100,
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Center(child: Text("完成!",style: TextStyle(color: Colors.white,fontSize: 50),),),
                  );
                }

              },
            ),
          ),
          Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
            child: BlocBuilder<HiitCountdownPageCubit, HiitCountdownPageState>(
              builder: (context, state) {

                if(state.restCountdownSecond>0){
                  BlocProvider.of<HiitCountdownPageCubit>(context).referExerciseSecond();
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
                              Expanded(child:Text("${state.restInterval}",
                                      style: TextStyle(
                                          color: Colors.grey[700]!,
                                          fontSize: 50))

                              ,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }else if(state.restCountdownSecond==0&&state.runType==2){
                  if(state.runType==2){
                    BlocProvider.of<HiitCountdownPageCubit>(context).startExerciseCountdown();
                    BlocProvider.of<HiitCountdownPageCubit>(context).settingRunType(1);

                  }
                  return Container(
                    color: Colors.teal[100],
                    height: 100,
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Center(child: Text("开始!",style: TextStyle(color: Colors.black,fontSize: 50),),),
                  );
                }else{
                  return Container(
                    color:  Colors.teal[100],
                    height: 100,
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Center(child: Text("完成!",style: TextStyle(color: Colors.black,fontSize: 50),),),
                  );
                }

              },
            ),
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
