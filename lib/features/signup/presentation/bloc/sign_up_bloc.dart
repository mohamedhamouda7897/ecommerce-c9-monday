import 'package:ecommerce_c9_monday/core/api/api_manager.dart';
import 'package:ecommerce_c9_monday/features/signup/data/data_sources/remote/remote_ds.dart';
import 'package:ecommerce_c9_monday/features/signup/data/data_sources/remote/remote_ds_impl.dart';
import 'package:ecommerce_c9_monday/features/signup/data/models/request_data.dart';
import 'package:ecommerce_c9_monday/features/signup/data/repositories/signup_repo_impl.dart';
import 'package:ecommerce_c9_monday/features/signup/domain/entities/UserEntity.dart';
import 'package:ecommerce_c9_monday/features/signup/domain/repositories/signup_repo.dart';
import 'package:ecommerce_c9_monday/features/signup/domain/use_cases/signup_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  ApiManager apiManager;

  static SignUpBloc get(context) => BlocProvider.of(context);

  SignUpBloc(this.apiManager) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is RegisterEvent) {
        emit(state.copyWith(screenStatus: ScreenStatus.loading));

        RemoteDataSource remoteDataSource = RemoteDataSourceImpl(apiManager);
        SignupRepo signupRepo = SignUpRepoImpl(remoteDataSource);
        SignUpUseCase signUpUseCase = SignUpUseCase(signupRepo);
        RequestData requestData = RequestData(
            name: "Mohamed",
            email: "Mohamed24544@gmail.com",
            password: "123@Hamouda",
            rePassword: "123@Hamouda",
            phone: "01110944558");
        try {
          UserEntity userEntity = await signUpUseCase.call(requestData);

          emit(state.copyWith(
              screenStatus: ScreenStatus.successfully, userEntity: userEntity));
        } catch (e) {
          emit(state.copyWith(screenStatus: ScreenStatus.failures));
        }
      }
    });
  }
}
