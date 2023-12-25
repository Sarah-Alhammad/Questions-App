import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionsapp/features/question/domain/entities/question.dart';
import 'package:questionsapp/features/question/presention/bloc/question_edit/add_delete_update_bloc.dart';
import 'package:questionsapp/features/question/presention/bloc/question_get/question_bloc.dart';
import 'package:questionsapp/features/question/presention/screen/question_screen.dart';
import 'package:questionsapp/features/question/presention/widgets/loading_widget.dart';
import 'package:questionsapp/features/question/presention/widgets/massage_display_widget.dart';

import '../widgets/form_widget.dart';
class AddUpdateScreen extends StatelessWidget {
  bool isUpdate;
  Question ? question;
   AddUpdateScreen({Key? key,required this.isUpdate,this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(isUpdate ? "Update Question" : "Add Question"),),body:
      Center(child: Padding(padding: EdgeInsets.all(8),
      child: BlocConsumer<AddDeleteUpdateBloc,AddDeleteUpdateState>(builder: (context,state){
        if(state is LoadingAddDeleteUpdateState)
          return LoadingWidget();

          return FormWidget(isUpdate:isUpdate,question:isUpdate?question :null);
        }

      ,

          listener: (context,state){

            if (state is MassageAddDeleteUpdateState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    state.massage,
                    style:const TextStyle(
                        backgroundColor: Colors.green, color: Colors.white),
                  )));
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => QuestionScreen()),
                      (route) => false);
            } else if (state is ErrorAddDeleteUpdateState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    state.massage,
                    style:const TextStyle(
                        backgroundColor: Colors.red, color: Colors.white),
                  )));
            }
          }),),));
  }
}
