import 'package:dartz/dartz.dart';
import 'package:questionsapp/features/question/domain/repositories/question_repository.dart';

import '../../../../core/error/failure.dart';

class DeleteQuestionUseCase {
  final QuestionRepository questionRepository;

  DeleteQuestionUseCase(this.questionRepository);

  Future<Either<Failure,Unit>> call(int id) async {
    return   await questionRepository.deleteQuestion(id);
  }


}