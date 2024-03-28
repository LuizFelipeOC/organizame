abstract interface class IForgotRecoveryState {}

class IdleSendMailer extends IForgotRecoveryState {}

class LoadingSendMailer extends IForgotRecoveryState {}

class SuccessSendMailer extends IForgotRecoveryState {}

class FailureSendMailer extends IForgotRecoveryState {}
