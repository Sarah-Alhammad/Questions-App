import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionsapp/features/question/data/models/question-model.dart';
import 'package:questionsapp/features/question/presention/bloc/question_edit/add_delete_update_bloc.dart';
import 'package:questionsapp/features/question/presention/bloc/question_get/question_bloc.dart';
import 'features/question/presention/screen/question_detail_screen.dart';
import 'features/question/presention/screen/question_screen.dart';
import 'injection.dart' as di;
void main() {

WidgetsFlutterBinding.ensureInitialized();
di.init();
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>di.sl<QuestionBloc>()..add(GetAllQuestionEvent())),
      BlocProvider(create: (_)=>di.sl<AddDeleteUpdateBloc>())

    ], child: const MaterialApp(
      home: QuestionScreen(),
    ));
}
}