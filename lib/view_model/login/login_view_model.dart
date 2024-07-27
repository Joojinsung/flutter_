import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:wadiz_clone/model/login/login_model.dart";
import "package:wadiz_clone/repository/login/login_repository.dart";

part 'login_view_model.g.dart';

part 'login_view_model.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool isLogin,
    int? userid,
    String? email,
    String? password,
    String? username,
  }) = _LoginState;

  factory LoginState.init() {
    return LoginState(
      email: "",
      password: "",
      isLogin: false,
      userid: 0,
      username: "",
    );
  }
}

@Riverpod(keepAlive: true)
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() {
    return LoginState.init();
  }

  Future<bool> signUp(LoginModel body) async {
    final result = await ref.watch(loginRepositoryProvider).signUp(
          body,
        );
    if (result.statue == "ok") {
      return true;
    }
    return false;
  }

  Future<bool> checkEmail(LoginModel body) async {
    final result = await ref.watch(loginRepositoryProvider).checkEmail(
          body,
        );
    if (result.statue == "ok") {
      return true;
    }
    return false;
  }
}
