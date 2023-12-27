import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:questionsapp/core/error/exception.dart';
import 'package:questionsapp/features/question/data/models/question-model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class QuestionLocalDataSource {
  Future<List<QuestionModel>> getCashQuestion();

  Future<Unit> cacheQuestion(List<QuestionModel> questionModels);
}

class QuestionLocalDataSourceImp extends QuestionLocalDataSource {
  SharedPreferences sharedPreferences;

  QuestionLocalDataSourceImp(this.sharedPreferences);

  @override
  Future<Unit> cacheQuestion(List<QuestionModel> questionModels) {
    List questionModelToJson = questionModels
        .map<Map<String, dynamic>>((question) => question.toJson())
        .toList();
    sharedPreferences.setString(
        "cached question", json.encode(questionModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<QuestionModel>> getCashQuestion() async{
    final jsonString = sharedPreferences.getString("cached question");
    if (jsonString != null) {
      List stringDecode = json.decode(jsonString);
      List<QuestionModel> jsonToQuestionModels = stringDecode
          .map<QuestionModel>((jsonToQuestionModel) =>
              QuestionModel.fromJson(jsonToQuestionModel))
          .toList();
      return Future.value(jsonToQuestionModels);
    }
  throw EmptyCacheException();
  }
}
