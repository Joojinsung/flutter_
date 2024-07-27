import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wadiz_clone/model/login/login_model.dart';
import 'package:wadiz_clone/service/login/login_api.dart';
import 'package:wadiz_clone/service/login/login_api_service.dart';

import '../../shared/model/response_model.dart';

part 'login_repository.g.dart';

class LoginRepository {
  LoginApiClient loginService;

  LoginRepository(this.loginService);

  Future<ResponseModel> signUp(LoginModel body) async {
    final result = await loginService.signUp(body);
    return result;
  }

  Future<ResponseModel> checkEmail(LoginModel body) async {
    final result = await loginService.checkEmail(body);
    return result;
  }
}

@Riverpod(keepAlive: true)
LoginRepository loginRepository(LoginRepositoryRef ref) {
  final service = ref.watch(loginApiClientProvider);
  return LoginRepository(service);
}
