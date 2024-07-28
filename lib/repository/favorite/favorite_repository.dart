import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wadiz_clone/shared/shared_pref_provider.dart';

part 'favorite_repository.g.dart';

@riverpod
FavoriteRepository favoriteRepository(FavoriteRepositoryRef ref) {
  final pref = ref.watch(sharedPreferencesProvider);
  return FavoriteRepository(pref);
}

class FavoriteRepository {
  SharedPreferences pref;

  FavoriteRepository(this.pref);

  Future<bool> saveValue(String key, String value) async {
    final result = await pref.setString(key, value);

    return result;
  }

  Future<String?> readValue(String key) async {
    final result = pref.getString(key);

    return result;
  }
}
