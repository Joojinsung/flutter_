import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:wadiz_clone/shared/model/response_model.dart';
import '../../model/home/home_model.dart';
import '../../model/login/login_model.dart'; // HomeModel 임포트 추가

part 'login_api.g.dart';

@RestApi(baseUrl: "https://localhost:3000/api/v1")
abstract class LoginApiClient {
  factory LoginApiClient(Dio dio, {String baseUrl}) = _LoginApiClient;

  @POST("/signup")
  Future<ResponseModel> signUp(
    @Body() LoginModel loginModel,
  );

  @POST("/signin")
  Future<HttpResponse<dynamic>> signIn(
    @Body() LoginModel body,
  );

  @GET("/checkauth")
  Future<ResponseModel> checkEmail(
    @Body() LoginModel body,
  );
}
