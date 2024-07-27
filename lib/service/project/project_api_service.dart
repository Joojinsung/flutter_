import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wadiz_clone/service/project/project_api.dart';
import 'package:wadiz_clone/shared/network_provider.dart';

part 'project_api_service.g.dart';

@riverpod
ProjectApiClient projectApiClient(ProjectApiClientRef ref) {
  final dio = ref.watch(dioProvider);

  var localhost = "localhost";

  if (defaultTargetPlatform == TargetPlatform.android) {
    localhost = "10.0.2.2";
  }


  return ProjectApiClient(dio, baseUrl: "http://$localhost:3000/api/v1");
}