part of 'sign_up_bloc.dart';

enum ScreenStatus { init, loading, successfully, failure }

class SignUpState {
  final ScreenStatus? screenStatus;
  final UserEntity? userEntity;
  final Failures? failures;

  SignUpState({this.screenStatus, this.userEntity, this.failures});
  SignUpState copyWith(
      {ScreenStatus? screenStatus,
      UserEntity? userEntity,
      Failures? failures}) {
    return SignUpState(
        screenStatus: screenStatus ?? this.screenStatus,
        userEntity: userEntity ?? this.userEntity,
        failures: failures ?? this.failures);
  }
}

class SignUpInitial extends SignUpState {
  SignUpInitial() : super(screenStatus: ScreenStatus.init);
}
