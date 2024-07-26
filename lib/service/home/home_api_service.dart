import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wadiz_clone/shared/network_provider.dart';

import 'home_api.dart';

part 'home_api_service.g.dart';

@riverpod
HomeApi homeApiService(HomeApiServiceRef ref) {

  final dio= ref.watch(dioProvider);

  String localhost = "localhost";
  if (defaultTargetPlatform == TargetPlatform.android) {
    localhost = "10.0.2.2";
  }
  return HomeApi(dio, baseUrl: "http://$localhost:3000/api/v1");
}
