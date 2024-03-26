import 'package:firebase_auth/firebase_auth.dart';

class SuccessAuthentication {
  User? user;

  SuccessAuthentication({this.user});
}

class FailureAuthentication {
  final String? code;
  final String? message;

  FailureAuthentication({this.code, this.message});
}
