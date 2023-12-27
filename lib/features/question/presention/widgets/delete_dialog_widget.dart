import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionsapp/features/question/presention/bloc/question_edit/add_delete_update_bloc.dart';

class DeleteDialogWidget extends StatelessWidget {
  final int questionId;

  const DeleteDialogWidget({Key? key, required this.questionId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Are you sure ?"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("No")),
        TextButton(
            onPressed: () {
              BlocProvider.of<AddDeleteUpdateBloc>(context)
                  .add(DeleteQuestionEvent(questionId));
            },
            child: Text("Yes")),
      ],
    );
  }
}
