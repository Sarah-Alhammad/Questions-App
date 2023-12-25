import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionsapp/features/question/presention/bloc/question_get/question_bloc.dart';
import 'package:questionsapp/features/question/presention/screen/AddUpdateScreen.dart';

import '../widgets/loading_widget.dart';
import '../widgets/massage_display_widget.dart';
import '../widgets/question_list_widget.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" All Question "),),
        body:Padding(padding: EdgeInsets.all(10),
        child: BlocBuilder<QuestionBloc,QuestionState>(builder: (context,state){
          if (state is LoadingQuestionState)
            return LoadingWidget();
          else if (state is LoadedQuestionstate){
            return RefreshIndicator(
                child:QuestionListWidget(questions: state.questions,),
                onRefresh:() async {
                  BlocProvider.of<QuestionBloc>(context).add(RefreshQuestionEvent());
                });
          }
          else if (state is ErrorQuestionState){
            return MassageDisplayWidget(massage : state.massage);
          }

            return SizedBox();
        }),)
    ,floatingActionButton: FloatingActionButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>AddUpdateScreen(isUpdate:false)));


    },child: Icon(Icons.add),),);
  }
}
