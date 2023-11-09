import 'package:ecommerce_c9_monday/core/api/api_manager.dart';
import 'package:ecommerce_c9_monday/core/error/failuers.dart';
import 'package:ecommerce_c9_monday/features/login/data/data_sources/local/login_local_ds.dart';
import 'package:ecommerce_c9_monday/features/login/data/data_sources/local/login_local_ds_impl.dart';
import 'package:ecommerce_c9_monday/features/login/data/data_sources/remote/login_remote_ds_impl.dart';
import 'package:ecommerce_c9_monday/features/login/data/data_sources/remote/remote_ds.dart';
import 'package:ecommerce_c9_monday/features/login/data/repositories/login_repo_impl.dart';
import 'package:ecommerce_c9_monday/features/login/domain/repositories/login_repo.dart';
import 'package:ecommerce_c9_monday/features/login/domain/use_cases/login_usecase.dart';
import 'package:ecommerce_c9_monday/features/signup/domain/entities/UserEntity.dart';
import 'package:ecommerce_c9_monday/features/signup/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static LoginBloc get(context) => BlocProvider.of(context);

  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginButtonEvent) {
        emit(state.copyWith(screenStatus: ScreenStatus.loading));
        ApiManager apiManager = ApiManager();
        LoginRemoteDS loginRemoteDS = LoginRemoteDSImpl(apiManager);
        LoginLocalDS localDS = LoginLocalDSImpl();
        LoginRepo loginRepo = LoginRepoImpl(loginRemoteDS, localDS);
        LoginUseCase loginUseCase = LoginUseCase(loginRepo);

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
