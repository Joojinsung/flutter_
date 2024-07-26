import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../model/home/home_model.dart'; // HomeModel 임포트 추가

part 'home_api.g.dart';

@RestApi(baseUrl: "https://localhost:3000/api/v1")
abstract class HomeApi {
  factory HomeApi(Dio dio, {String baseUrl}) = _HomeApi;

  @GET("/home")
  Future<HomeModel> getHomeProjects(); // 메서드 이름 수정
}
