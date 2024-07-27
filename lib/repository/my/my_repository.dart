import 'package:riverpod_annotation/riverpod_annotation.dart';

part "my_repository.g.dart";

@riverpod
MyRepositoryImpl myRepository(MyRepositoryRef ref) {
  return MyRepositoryImpl();
}

abstract class MyRepository {
  Future getProjectByUserId(String userId);

  Future updateProjectOpenState(String id);

  Future deleteProject(String id);
}

class MyRepositoryImpl implements MyRepository {
  @override
  Future deleteProject(String id) {
    // TODO: implement deleteProject
    throw UnimplementedError();
  }

  @override
  Future getProjectByUserId(String userId) {
    // TODO: implement getProjectByUserId
    throw UnimplementedError();
  }

  @override
  Future updateProjectOpenState(String id) {
    // TODO: implement updateProjectOpenState
    throw UnimplementedError();
  }
}
