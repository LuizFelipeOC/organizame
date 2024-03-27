enum RegisterAccountFailures {
  invalidEmail,
  invalidPassword,
  unknownError,
  rateLimitAccess,
}

class RegisterSuccessResult {
  final String accessToken;

  RegisterSuccessResult({
    required this.accessToken,
  });
}
