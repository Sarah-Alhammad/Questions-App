part of 'question_bloc.dart';

@immutable
abstract class QuestionEvent extends Equatable{

  @override
  List<Object> get props =>[];
}

class GetAllQuestionEvent extends QuestionEvent{}
class RefreshQuestionEvent extends QuestionEvent{}