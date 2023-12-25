part of 'question_bloc.dart';

@immutable
abstract class QuestionState extends Equatable {

  @override
  List<Object> get props =>[];
}

class QuestionInitial extends QuestionState {}
class LoadingQuestionState extends QuestionState{}
class LoadedQuestionstate extends QuestionState{
  List<Question> questions ;

  LoadedQuestionstate(this.questions);
  @override
  List<Object> get props =>[questions];

}
class ErrorQuestionState extends QuestionState{
  String massage;

  ErrorQuestionState(this.massage);
  @override
  List<Object> get props =>[massage];

}