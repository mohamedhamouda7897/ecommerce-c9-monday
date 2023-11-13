import 'package:ecommerce_c9_monday/core/error/failuers.dart';
import 'package:ecommerce_c9_monday/features/login/domain/use_cases/login_usecase.dart';
import 'package:ecommerce_c9_monday/features/signup/domain/entities/UserEntity.dart';
import 'package:ecommerce_c9_monday/features/signup/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static LoginBloc get(context) => BlocProvider.of(context);

  LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginButtonEvent) {
        emit(state.copyWith(screenStatus: ScreenStatus.loading));

        var result = await loginUseCase.call("sra@gmail.com", "sama@123");
        result.fold((l) {
          emit(
              state.copyWith(screenStatus: ScreenStatus.failures, failures: l));
        }, (r) {
          emit(state.copyWith(
              userEntity: r, screenStatus: ScreenStatus.successfully));
        });
      }
    });
  }
}
