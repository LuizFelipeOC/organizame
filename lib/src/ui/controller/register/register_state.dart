abstract interface class RegisterState {}

class IdleRegisterState extends RegisterState {}

class LoadingRegisterState extends RegisterState {}

class ErrorRegisterState extends RegisterState {}

class SuccessRegisterState extends RegisterState {}
