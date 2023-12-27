
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:questionsapp/features/question/data/datasources/question_local_data_source.dart';
import 'package:questionsapp/features/question/data/datasources/question_remote_data_source.dart';
import 'package:questionsapp/features/question/data/repositories/question_repository_implement.dart';
import 'package:questionsapp/features/question/domain/usecases/add_delete_update_get_usecases_question.dart';
import 'package:questionsapp/features/question/presention/bloc/question_edit/add_delete_update_bloc.dart';
import 'package:questionsapp/features/question/presention/bloc/question_get/question_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_information.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //FEATURE POST

  //Bloc
  sl.registerFactory(() => QuestionBloc(sl()));
  sl.registerFactory(() => AddDeleteUpdateBloc( sl(), sl(), sl()));

  //usecases
  sl.registerLazySingleton(() => GetAllQuestionUseCase(sl()));
  sl.registerLazySingleton(() => AddQuestionUseCase(sl()));
  sl.registerLazySingleton(() => UpdateQuestionUseCase(sl()));
  sl.registerLazySingleton(() => DeleteQuestionUseCase(sl()));
  //repository
  sl.registerLazySingleton(() => QuestionRepositoryImp(sl(),sl(),sl()));

  //Datasources
   sl.registerLazySingleton<QuestionRemoteDataSource>(() => QuestionRemoteDataSourceImp());
  sl.registerLazySingleton<QuestionLocalDataSource>(() => QuestionLocalDataSourceImp(sl()));
  //core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  //External
  final sharedPreferences=SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}