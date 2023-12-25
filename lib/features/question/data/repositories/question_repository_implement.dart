import 'package:dartz/dartz.dart';
import 'package:questionsapp/core/error/exception.dart';
import 'package:questionsapp/core/error/failure.dart';
import 'package:questionsapp/core/network/network_information.dart';
import 'package:questionsapp/features/question/domain/entities/question.dart';
import 'package:questionsapp/features/question/domain/repositories/question_repository.dart';

import '../datasources/question_local_data_source.dart';
import '../datasources/question_remote_data_source.dart';
import '../models/questionModel.dart';

class QuestionRepositoryImp extends QuestionRepository{
final  QuestionRemoteDataSource questionRemoteDataSource;
final  QuestionLocalDataSource questionLocalDataSource;
final NetworkInfo networkInfo;


QuestionRepositoryImp(  this.questionLocalDataSource,  this.questionRemoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, Unit>> addQuestion(Question question ) async {
    if(await networkInfo.isConnected){
      try{
        final QuestionModel questionModel=QuestionModel(question.id, question.questionText, question.answer);
        questionRemoteDataSource.addQuestion(questionModel);
        return Right(unit);
    } on ServerException{
        return Left(ServerFailure());
      }
    }
    else
      {
        return Left(OffLineFailure());
      }

  }

  @override
  Future<Either<Failure, Unit>> deleteQuestion(int id) async{
    if(await networkInfo.isConnected){
      try{
        questionRemoteDataSource.deleteQuestion(id);
        return Right(unit);
      } on ServerException{
        return Left(ServerFailure());
      }
    }
    else
    {
      return Left(OffLineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Question>>> getAllQuestion() async{
 if(await networkInfo.isConnected)
   {
     try{
       final remoteQuestion=await questionRemoteDataSource.getAllQuestion();
       questionLocalDataSource.cachQuestion(remoteQuestion);
       return Right(remoteQuestion);
     }on ServerException{
       return Left(ServerFailure());
     }
   }
 else
   {
     {
       try{
         final remoteQuestion=await questionLocalDataSource.getCashQuestion();
         return Right(remoteQuestion);
       }on EmptyCacheException{
         return Left(EmptyCacheFailure());
       }
     }

   }

  }

  @override
  Future<Either<Failure, Unit>> updateQuestion(Question question) async{
    if(await networkInfo.isConnected){
      try{
        final QuestionModel questionModel=QuestionModel(question.id, question.questionText, question.answer);
        questionRemoteDataSource.updateQuestion(questionModel);
        return Right(unit);
      } on ServerException{
        return Left(ServerFailure());
      }
    }
    else
    {
      return Left(OffLineFailure());
    }
  }

}