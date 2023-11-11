import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/error/failuers.dart';
import '../../data/data_sources/remote/remote_ds.dart';
import '../../data/data_sources/remote/remote_ds_impl.dart';
import '../../data/models/request_data.dart';
import '../../data/repositories/sign_up_repo_impl.dart';
import '../../domain/entities/UserEntity.dart';
import '../../domain/repositories/sign_up_repo.dart';
import '../../domain/use_cases/signup_usecase.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  static SignUpBloc get(context) => BlocProvider.of(context);
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is RegisterEvent) {
        emit(state.copyWith(screenStatus: ScreenStatus.loading));
        ApiManager apiManager = ApiManager();
        RemoteDataSource remoteDataSource = RemoteDataSourceImpl(apiManager);
        SignUpRepo signUpRepo = SignUpRepoImpl(remoteDataSource);
        SignUpUseCase signUpUseCase = SignUpUseCase(signUpRepo);
        RequestData requestData = RequestData(
            name: fullNameController.text,
            email: emailController.text,
            password: passwordController.text,
            rePassword: rePasswordController.text,
            phone: mobileNumberController.text);
        var result = await signUpUseCase.call(requestData);
        result.fold((l) {
          emit(state.copyWith(screenStatus: ScreenStatus.failure, failures: l));
        }, (r) {
          emit(state.copyWith(
              screenStatus: ScreenStatus.successfully, userEntity: r));
        });
      }
    });
  }
}
