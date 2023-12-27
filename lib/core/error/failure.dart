import 'package:equatable/equatable.dart';

abstract class Failure {}

class ServerFailure extends Failure {}

class EmptyCacheFailure extends Failure {}

class OffLineFailure extends Failure {}
