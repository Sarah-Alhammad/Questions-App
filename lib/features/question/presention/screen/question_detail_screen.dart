import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionsapp/features/question/domain/entities/question.dart';
import 'package:questionsapp/features/question/presention/bloc/question_edit/add_delete_update_bloc.dart';
import 'package:questionsapp/features/question/presention/screen/add_update_sceen.dart';
import 'package:questionsapp/features/question/presention/widgets/delete_dialog_widget.dart';
import 'package:questionsapp/features/question/presention/widgets/loading_widget.dart';

class QuestionDetailScreen extends StatelessWidget {
  final Question question;

  const QuestionDetailScreen({Key? key, required this.question})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(question.questionText,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const Divider(
            height: 50,
          ),
          Text(question.answer,
              style: const TextStyle(
                fontSize: 16,
              )),
          const Divider(
            height: 50,
          ),
          Row(
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AddUpdateScreen(
                            isUpdate: true,
                            question: question,
                          ),
                        ));
                  },
                  icon: Icon(Icons.edit),
                  label: Text("Edit")),
              ElevatedButton.icon(
                onPressed: () {
                  BlocConsumer<AddDeleteUpdateBloc, AddDeleteUpdateState>(
                      builder: (context, state) {
                    if (state is LoadingAddDeleteUpdateState)
                      return LoadingWidget();

                    return DeleteDialogWidget(questionId: question.id!);
                  }, listener: (context, state) {
                    if (state is ErrorAddDeleteUpdateState) {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.massage)));
                    } else if (state is MassageAddDeleteUpdateState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.massage)));
                    }
                  });
                },
                icon: Icon(Icons.delete),
                label: Text("Delete"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent)),
              )
            ],
          )
        ],
      ),
    );
  }
}
