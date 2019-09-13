import 'package:flutter/material.dart';
import 'package:provider_arc/core/services/authentication_service.dart';

class LoginViewModel extends ChangeNotifier {
  AuthenticationService _authenticationService;

  LoginViewModel({ @required AuthenticationService authenticationService})
      : _authenticationService = authenticationService;

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  Future<bool> login(String userIdText) async {
    setBusy(true);
    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId);
    setBusy(false);
    return success;
  }

}