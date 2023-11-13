import 'package:ecommerce_c9_monday/core/cache/shared_pref.dart';
import 'package:ecommerce_c9_monday/features/login/data/data_sources/local/login_local_ds.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginLocalDS)
class LoginLocalDSImpl implements LoginLocalDS {
  @override
  Future<bool> cacheToken(String token) {
    try {
      return CacheData.saveData("token", token);
    } catch (e) {
      throw Exception();
    }
  }
}
