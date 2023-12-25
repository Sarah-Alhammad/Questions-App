import 'package:dartz/dartz.dart';
import 'package:questionsapp/features/question/domain/repositories/question_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/question.dart';

class GetAllQuestionUseCase {
  final QuestionRepository questionRepository;

  GetAllQuestionUseCase(this.questionRepository);
  Future<Either<Failure,List<Question>>> call() async{
   return await questionRepository.getAllQuestion();
  }



}