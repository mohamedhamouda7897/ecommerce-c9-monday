part of 'forgot_password_screen_bloc.dart';

@immutable
abstract class ForgotPasswordScreenEvent {}

class ForgotPasswordClicked extends ForgotPasswordScreenEvent {}

class ResetCodeClicked extends ForgotPasswordScreenEvent {}

class ResetPasswordClicked extends ForgotPasswordScreenEvent {}
