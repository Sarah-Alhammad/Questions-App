import 'package:dartz/dartz.dart';
import 'package:questionsapp/features/question/domain/entities/question.dart';
import 'package:questionsapp/features/question/domain/repositories/question_repository.dart';

import '../../../../core/error/failure.dart';

class AddQuestionUseCase {

  QuestionRepository questionRepository;

  AddQuestionUseCase(this.questionRepository);

  Future<Either<Failure,Unit>> call( Question question) async{
    return await questionRepository.addQuestion(question);
  }
}