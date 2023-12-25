import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:questionsapp/features/question/domain/entities/question.dart';
import 'package:questionsapp/features/question/domain/usecases/get_all_question.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/error/failure.dart';
part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
GetAllQuestionUseCase getAllQuestionUseCase;

  QuestionBloc(this.getAllQuestionUseCase) : super(QuestionInitial()) {
    on<QuestionEvent>((event, emit) async
    {
       if(event is GetAllQuestionEvent){
        final questionOrFailure=await getAllQuestionUseCase();
        questionOrFailure.fold((failure) {
          emit(ErrorQuestionState(massageOfError(failure)));

        }, (question) => {
          emit(LoadedQuestionstate(question))
        });


       }
       else if (event is RefreshQuestionEvent){
         final questionOrFailure=await getAllQuestionUseCase();
         questionOrFailure.fold((failure) {
           emit(ErrorQuestionState(massageOfError(failure)));

         }, (question) => {
           emit(LoadedQuestionstate(question))
         });
       }

    });
  }
}
String massageOfError(Failure failure){
  switch(failure.runtimeType){
    case ServerFailure : return "please try again later";
    case EmptyCacheFailure :return "NO Data";
    case OffLineFailure :return "please check your Internet Connection";
    default : return "UnExpected Error Try again later" ;
  }

}
