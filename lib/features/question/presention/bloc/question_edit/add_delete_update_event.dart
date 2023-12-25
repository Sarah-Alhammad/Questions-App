part of 'add_delete_update_bloc.dart';

@immutable
abstract class AddDeleteUpdateEvent extends Equatable{

  @override
  List<Object> get props =>[];
}
class AddQuestionEvent extends AddDeleteUpdateEvent{
  final Question question;

  AddQuestionEvent(this.question);

  @override
  List<Object> get props =>[question];

}
class DeleteQuestionEvent extends AddDeleteUpdateEvent{
  final int id;
  DeleteQuestionEvent(this.id);

}
class UpdateQuestionEvent extends AddDeleteUpdateEvent{
  final Question question;

  UpdateQuestionEvent(this.question);

  @override
  List<Object> get props =>[question];
}