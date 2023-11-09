part of 'login_bloc.dart';

@immutable
class LoginState {
  final ScreenStatus? screenStatus;
  final UserEntity? userEntity;
  final Failures? failures;

  const LoginState({this.screenStatus, this.userEntity, this.failures});

  LoginState copyWith(
      {ScreenStatus? screenStatus,
      UserEntity? userEntity,
      Failures? failures}) {
    return LoginState(
        screenStatus: screenStatus ?? this.screenStatus,
        failures: failures ?? this.failures,
        userEntity: userEntity ?? this.userEntity);
  }
}

class LoginInitial extends LoginState {
  const LoginInitial()
      : super(
          screenStatus: ScreenStatus.init,
        );
}
