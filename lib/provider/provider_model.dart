import 'package:flutter/foundation.dart';

class ProviderModel extends ChangeNotifier {
  String? message;
  void messageOnDilog(String? msg) {
    message = msg;
    notifyListeners();
  }
}
