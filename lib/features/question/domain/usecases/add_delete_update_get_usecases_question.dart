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

class DeleteQuestionUseCase {
  final QuestionRepository questionRepository;

  DeleteQuestionUseCase(this.questionRepository);

  Future<Either<Failure,Unit>> call(int id) async {
    return   await questionRepository.deleteQuestion(id);
  }
}
class GetAllQuestionUseCase {
  final QuestionRepository questionRepository;

  GetAllQuestionUseCase(this.questionRepository);
  Future<Either<Failure,List<Question>>> call() async{
    return await questionRepository.getAllQuestion();
  }

}
class UpdateQuestionUseCase {
  QuestionRepository questionRepository;

  UpdateQuestionUseCase(this.questionRepository);
  Future<Either<Failure,Unit>> call(Question question) async{
    return  await questionRepository.updateQuestion(question);

  }
}