enum RegisterAccountFailures {
  invalidEmail,
  invalidPassword,
  unknownError,
  rateLimitAccess,
  emailAlreadyExist,
}

class RegisterSuccessResult {
  final String accessToken;

  RegisterSuccessResult({
    required this.accessToken,
  });
}
