import 'package:internet_connection_checker/internet_connection_checker.dart';
class NetworkInfo{
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInfo(this.internetConnectionChecker);

  Future<bool> get isConnected => internetConnectionChecker.hasConnection;

}