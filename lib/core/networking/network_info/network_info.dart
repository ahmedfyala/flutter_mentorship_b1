import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfo {
  static Future<bool> isConnected = InternetConnectionChecker().hasConnection;
}
