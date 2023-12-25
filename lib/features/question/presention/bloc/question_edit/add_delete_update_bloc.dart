import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:questionsapp/features/question/domain/entities/question.dart';
import 'package:questionsapp/features/question/domain/usecases/add_question.dart';
import 'package:questionsapp/features/question/domain/usecases/delete_question.dart';
import 'package:questionsapp/features/question/domain/usecases/update_question.dart';

import '../../../../../core/error/failure.dart';

part 'add_delete_update_event.dart';

part 'add_delete_update_state.dart';

class AddDeleteUpdateBloc
    extends Bloc<AddDeleteUpdateEvent, AddDeleteUpdateState> {
  final AddQuestionUseCase addQuestionUseCase;
  final DeleteQuestionUseCase deleteQuestionUseCase;
  final UpdateQuestionUseCase updateQuestionUseCase;

  AddDeleteUpdateBloc(this.updateQuestionUseCase, this.deleteQuestionUseCase,
      this.addQuestionUseCase)
      : super(AddDeleteUpdateInitial()) {
    on<AddDeleteUpdateEvent>((event, emit) async {
      if(event is AddQuestionEvent)
        {
          emit(LoadingAddDeleteUpdateState());
          final failureOrDoneMassage= await addQuestionUseCase(event.question);
          failureOrDoneMassage.fold((failure) => {
            emit(ErrorAddDeleteUpdateState(massageOfError(failure)))
          }, (doneMassage) => {
            emit(MassageAddDeleteUpdateState("Add Success Question"))
          });

        }
      else if (event is UpdateQuestionEvent){
        emit(LoadingAddDeleteUpdateState());
        final failureOrDoneMassage= await updateQuestionUseCase(event.question);
        failureOrDoneMassage.fold((failure) => {
          emit(ErrorAddDeleteUpdateState(massageOfError(failure)))
        }, (doneMassage) => {
          emit(MassageAddDeleteUpdateState("Update Success Question"))
        });

      }
      else if (event is DeleteQuestionEvent){
        emit(LoadingAddDeleteUpdateState());
        final failureOrDoneMassage= await deleteQuestionUseCase(event.id);
        failureOrDoneMassage.fold((failure) => {
          emit(ErrorAddDeleteUpdateState(massageOfError(failure)))
        }, (doneMassage) => {
          emit(MassageAddDeleteUpdateState("Delete Success Question"))
        });
      }


    });
  }
}
String massageOfError(Failure failure){
  switch(failure.runtimeType){
    case ServerFailure : return "please try again later";
    case OffLineFailure :return "please check your Internet Connection";
    default : return "UnExpected Error Try again later" ;
  }

}