
import "package:freezed_annotation/freezed_annotation.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:wadiz_clone/repository/home/home_repository.dart";

import "../../model/home/home_model.dart";
import "../../shared/model/category.dart";

part 'home_view_model.g.dart';

part 'home_view_model.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({@Default([]) List<HomeItemModel> projects}) = _HomeState;
}

@riverpod
class HomeViewModel extends _$HomeViewModel {
  HomeRepository? homeRepository;

  @override
  HomeState? build() {
    homeRepository = ref.watch(homeRepositoryProvider);
    return null;
  }

  update(List<HomeItemModel> projects) {
    state = state?.copyWith(
      projects: [...projects],
    );
  }

  Future<HomeModel?> fetchHomeData() async {
    final result = await homeRepository?.getHomeProjects();
    update(result?.projects ?? []);
    return result;
  }
}

@riverpod
Future<HomeModel> fetchHomeProject(FetchHomeProjectRef ref) async {
  try {
    final result = await ref.watch(homeViewModelProvider.notifier).fetchHomeData();
    return result ?? HomeModel();
  } catch (e) {
    return HomeModel();
  }
}

@riverpod
Future<List<ProjectCategory>> fetchHomeCategories(ref) async {
  await Future.delayed(Duration(milliseconds: 500));
  List<ProjectCategory> categories = [
    ProjectCategory(
      id: 1,
      iconPath: "assets/icons/categories/1.png",
      category: "Food",
      title: "Food & Drink",
      created: "2021-09-01",
    ),
    ProjectCategory(
      id: 2,
      iconPath: "assets/icons/categories/2.png",
      title: "2번!",
    ),
    ProjectCategory(
      id: 3,
      iconPath: "assets/icons/categories/3.png",
      title: "2번!",
    ),
    ProjectCategory(
      id: 4,
      iconPath: "assets/icons/categories/4.png",
      title: "2번!",
    ),
    ProjectCategory(
      id: 5,
      iconPath: "assets/icons/categories/5.png",
      title: "2번!",
    ),
    ProjectCategory(
      id: 6,
      iconPath: "assets/icons/categories/6.png",
      title: "2번!",
    ),
    ProjectCategory(
      id: 7,
      iconPath: "assets/icons/categories/7.png",
      title: "오픈예정!",
    ),
    ProjectCategory(
      id: 8,
      iconPath: "assets/icons/categories/8.png",
      title: "클래스 수강",
    ),
    ProjectCategory(
      id: 9,
      iconPath: "assets/icons/categories/8.png",
      title: "클래스 수강",
    ),
  ];
  return categories;
}
