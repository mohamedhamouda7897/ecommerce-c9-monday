import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../../core/api/api_manager.dart';
import '../../../../core/error/failuers.dart';
import '../../../product_list/presentation/bloc/product_list_bloc.dart';
import '../../data/data_sources/remote_ds/remote_ds.dart';
import '../../data/data_sources/remote_ds/remote_ds_impl.dart';
import '../../data/models/MessageModel.dart';
import '../../data/repositories/forgot_repo_impl.dart';
import '../../data/repositories/reset_code_repo_impl.dart';
import '../../data/repositories/reset_password_repo_impl.dart';
import '../../domain/repositories/forgot_repo.dart';
import '../../domain/use_cases/forgot_password_usecase.dart';

part 'forgot_password_screen_event.dart';
part 'forgot_password_screen_state.dart';

class ForgotPasswordScreenBloc
    extends Bloc<ForgotPasswordScreenEvent, ForgotPasswordScreenState> {
  static ForgotPasswordScreenBloc get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ForgotPasswordScreenBloc() : super(ForgotPasswordScreenInitial()) {
    on<ForgotPasswordScreenEvent>((event, emit) async {
      if (event is ForgotPasswordClicked) {
        emit(state.copyWith(screenStatus: ScreenStatus.loading));
        ApiManager apiManager = ApiManager();
        PasswordRemoteDS passwordRemoteDS = PasswordRemoteDSImpl(apiManager);
        ForgotPasswordRepo forgotPasswordRepo =
            ForgotRepoImpl(passwordRemoteDS);
        ForgotPasswordUseCase passwordUseCase =
            ForgotPasswordUseCase(forgotPasswordRepo);
        var result = await passwordUseCase.call(emailController.text);
        result.fold((l) {
          emit(
              state.copyWith(screenStatus: ScreenStatus.failures, failures: l));
        }, (r) {
          emit(state.copyWith(
              screenStatus: ScreenStatus.successfully, messageModel: r));
        });
      } else if (event is ResetCodeClicked) {
        emit(state.copyWith(screenStatus: ScreenStatus.loading));
        ApiManager apiManager = ApiManager();
        ResetCodeDS resetCodeDS = ResetCodeDsImpl(apiManager);
        ResetCodeRepo resetCodeRepo = ResetCodeRepoImpl(resetCodeDS);
        ResetCodeUseCase resetCodeUseCase = ResetCodeUseCase(resetCodeRepo);
        var result = await resetCodeUseCase.call(codeController.text);
        result.fold((l) {
          emit(
              state.copyWith(screenStatus: ScreenStatus.failures, failures: l));
        }, (r) {
          emit(state.copyWith(
              screenStatus: ScreenStatus.successfully, messageModel: r));
        });
      } else if (event is ResetPasswordClicked) {
        emit(state.copyWith(screenStatus: ScreenStatus.loading));
        ApiManager apiManager = ApiManager();
        ResetPasswordDs resetPasswordDs = ResetPasswordDsImpl(apiManager);
        ResetPasswordRepo resetPasswordRepo =
            ResetPasswordRepoImpl(resetPasswordDs);
        ResetPasswordUseCase resetPasswordUseCase =
            ResetPasswordUseCase(resetPasswordRepo);
        var result = await resetPasswordUseCase.call(
            emailController.text, passwordController.text);
        result.fold((l) {
          print("9898989898998    $l   989898989");
          emit(
              state.copyWith(screenStatus: ScreenStatus.failures, failures: l));
        }, (r) {
          emit(state.copyWith(
              screenStatus: ScreenStatus.successfully, messageModel: r));
        });
      }
    });
  }
}
