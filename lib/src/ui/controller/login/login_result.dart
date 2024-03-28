abstract interface class ILogin {}

class IdleLoginState extends ILogin {}

class LoadingLoginState extends ILogin {}

class SuccessLoginState extends ILogin {}

class InvalidCredentials extends ILogin {}

class ErrorLoginCredentials extends ILogin {}
