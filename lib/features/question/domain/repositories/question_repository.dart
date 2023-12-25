import 'package:dartz/dartz.dart';
import 'package:questionsapp/features/question/data/models/questionModel.dart';

import '../../../../core/error/failure.dart';
import '../entities/question.dart';

abstract class  QuestionRepository{
  Future<Either<Failure,List<Question>>> getAllQuestion();
  Future<Either<Failure,Unit>> updateQuestion(Question question);
  Future<Either<Failure,Unit>> addQuestion(Question question );
  Future<Either<Failure,Unit>> deleteQuestion(int id);
}