import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:questionsapp/core/error/exception.dart';
import 'package:questionsapp/features/question/data/models/questionModel.dart';
import 'package:http/http.dart';

import '../../../../core/constant.dart';

abstract class QuestionRemoteDataSource {
  Future<List<QuestionModel>> getAllQuestion();

  Future<Unit> updateQuestion(QuestionModel questionModel);

  Future<Unit> addQuestion(QuestionModel questionModel);

  Future<Unit> deleteQuestion(int id);
}

class QuestionRemoteDataSourceImp extends QuestionRemoteDataSource {
  final String _baseUrl = "https://parseapi.back4app.com/classes/";

  @override
  Future<Unit> addQuestion(QuestionModel questionModel) async {
    String apiUrl = _baseUrl + "Question";
    final response = await post(Uri.parse(apiUrl),
        headers: {
          'X-Parse-Application-Id': kParseApplicationId,
          'X-Parse-REST-API-Key': kParseRestApiKey,
          'Content-Type': 'application/json'
        },
        body: json.encode(questionModel.toJson()));
    if (response.statusCode == 201) {
      return Future.value(unit);
    }
    throw ServerException();
  }

  @override
  Future<Unit> deleteQuestion(int id) async {
    String apiUrl = _baseUrl + "Question/${id.toString()}";
    final response = await delete(Uri.parse(apiUrl), headers: {
      'X-Parse-Application-Id': kParseApplicationId,
      'X-Parse-REST-API-Key': kParseRestApiKey,
    });
    if (response.statusCode == 200) {
      return Future.value(unit);
    }
    throw ServerException();
  }

  @override
  Future<List<QuestionModel>> getAllQuestion() async {
    String apiUri = _baseUrl + "Question";
    final response = await get(Uri.parse(apiUri), headers: {
      'X-Parse-Application-Id': kParseApplicationId,
      'X-Parse-REST-API-Key': kParseRestApiKey,
    });
    List allQuestionDecode = json.decode(response.body);
    List<QuestionModel> jsonToQuestionModel = allQuestionDecode
        .map<QuestionModel>(
            (allQuestionDecode) => QuestionModel.fromJson(allQuestionDecode))
        .toList();
    if (response.statusCode == 200) {
      return jsonToQuestionModel;
    }
    throw ServerException();

  }

  @override
  Future<Unit> updateQuestion(QuestionModel questionModel) {
return Future.value(unit);
  }
}
