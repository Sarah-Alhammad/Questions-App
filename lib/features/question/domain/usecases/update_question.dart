import 'package:dartz/dartz.dart';
import 'package:questionsapp/features/question/domain/repositories/question_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/question.dart';

class UpdateQuestionUseCase {
  QuestionRepository questionRepository;

  UpdateQuestionUseCase(this.questionRepository);
  Future<Either<Failure,Unit>> call(Question question) async{
  return  await questionRepository.updateQuestion(question);

  }
}