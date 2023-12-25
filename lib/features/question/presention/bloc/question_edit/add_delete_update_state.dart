part of 'add_delete_update_bloc.dart';

@immutable
abstract class AddDeleteUpdateState extends Equatable {

  @override
  List<Object> get props =>[];
}

class AddDeleteUpdateInitial extends AddDeleteUpdateState {}
class LoadingAddDeleteUpdateState extends AddDeleteUpdateState{}
class ErrorAddDeleteUpdateState extends AddDeleteUpdateState{
  String massage;

  ErrorAddDeleteUpdateState(this.massage);
  @override
  List<Object> get props =>[massage];

}
class MassageAddDeleteUpdateState extends AddDeleteUpdateState{
  String massage;

  MassageAddDeleteUpdateState(this.massage);
  @override
  List<Object> get props =>[massage];
}