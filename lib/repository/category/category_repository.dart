import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wadiz_clone/service/category/category_api.dart';
import 'package:wadiz_clone/service/category/category_api_service.dart';

import '../../model/category/category_model.dart';

part 'category_repository.g.dart';

@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) {
  final service = ref.watch(categoryApiServiceProvider);
  return CategoryRepository(service);
}

class CategoryRepository {
  CategoryApiClient categoryApiClient;

  CategoryRepository(this.categoryApiClient);

  Future<CategoryModel> getCategoryProjects(
      String categoryId, String typeId) async {
    final result = await categoryApiClient.getProjectsByProejctType(
      categoryId,
      typeId,
    );

    return result;
  }

  Future<CategoryModel> getProjectsByCategoryId(String categoryId) async {
    final result = await categoryApiClient.getProjectsByCategoryId(categoryId);
    return result;
  }
}
