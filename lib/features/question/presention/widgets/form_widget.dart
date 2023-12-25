import 'package:dartz/dartz_streaming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionsapp/features/question/presention/bloc/question_edit/add_delete_update_bloc.dart';

import '../../domain/entities/question.dart';

class FormWidget extends StatefulWidget {
  final bool isUpdate;
  final Question? question;

  FormWidget({Key? key, this.question, required this.isUpdate})
      : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  TextEditingController questionTextController = TextEditingController();
  TextEditingController answerController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdate) {
      questionTextController.text = widget.question!.questionText;
      answerController.text = widget.question!.answer;
    }
  }

  void AddOrUpdateOnpressed() {
    final question = Question(
        id: widget.isUpdate ? widget.question!.id: null,
        questionText: questionTextController.text,
        answer: answerController.text);

    if (widget.isUpdate) {
      BlocProvider.of<AddDeleteUpdateBloc>(context)
          .add(UpdateQuestionEvent(question));
    } else {
      BlocProvider.of<AddDeleteUpdateBloc>(context)
          .add(AddQuestionEvent(question));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextFormField(
              controller: questionTextController,
              decoration: InputDecoration(hintText: "Question Text"),
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: TextFormField(
            maxLines: 3,
            minLines: 3,
            controller: answerController,
            decoration: InputDecoration(hintText: "Answer Text"),
          ),
        ),

      ],
    );
  }
}
