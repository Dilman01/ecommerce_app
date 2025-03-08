import 'package:ecommerce_app/core/services/secure_storage/secure_storage.dart';
import 'package:ecommerce_app/core/services/shared_pref/pref_keys.dart';
import 'package:ecommerce_app/core/services/shared_pref/shared_pref.dart';

abstract interface class AuthLocalDataSource {
  Future<void> logout();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  const AuthLocalDataSourceImpl();

  @override
  Future<void> logout() async {
    await SecureStorage().deleteAll();
    await SharedPref().removePreference(PrefKeys.userRole);
  }
}
