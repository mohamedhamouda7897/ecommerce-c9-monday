import 'package:ecommerce_c9_monday/features/signup/domain/entities/UserEntity.dart';

import '../../data/models/request_data.dart';

abstract class SignupRepo {
  Future<UserEntity> signUp(RequestData requestData);
}
