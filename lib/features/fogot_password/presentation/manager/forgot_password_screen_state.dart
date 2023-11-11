part of 'forgot_password_screen_bloc.dart';

@immutable
class ForgotPasswordScreenState {
  final ScreenStatus? screenStatus;
  final MessageModel? messageModel;
  final Failures? failures;

  const ForgotPasswordScreenState(
      {this.screenStatus, this.messageModel, this.failures});
  ForgotPasswordScreenState copyWith(
      {ScreenStatus? screenStatus,
      MessageModel? messageModel,
      Failures? failures}) {
    return ForgotPasswordScreenState(
        screenStatus: screenStatus ?? this.screenStatus,
        messageModel: messageModel ?? this.messageModel,
        failures: failures ?? this.failures);
  }
}

class ForgotPasswordScreenInitial extends ForgotPasswordScreenState {
  const ForgotPasswordScreenInitial() : super(screenStatus: ScreenStatus.init);
}
