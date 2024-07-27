// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchTypeTabsHash() => r'c01ee4c4b75cbe204ae4043b2890e6b6fbe2018a';

/// See also [fetchTypeTabs].
@ProviderFor(fetchTypeTabs)
final fetchTypeTabsProvider =
    AutoDisposeFutureProvider<List<ProjectType>>.internal(
  fetchTypeTabs,
  name: r'fetchTypeTabsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchTypeTabsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchTypeTabsRef = AutoDisposeFutureProviderRef<List<ProjectType>>;
String _$fetchCategoryProjectsHash() =>
    r'1eb0ac266809e514c92428572d9ec975d6050eb4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchCategoryProjects].
@ProviderFor(fetchCategoryProjects)
const fetchCategoryProjectsProvider = FetchCategoryProjectsFamily();

/// See also [fetchCategoryProjects].
class FetchCategoryProjectsFamily extends Family<AsyncValue<CategoryModel>> {
  /// See also [fetchCategoryProjects].
  const FetchCategoryProjectsFamily();

  /// See also [fetchCategoryProjects].
  FetchCategoryProjectsProvider call(
    String categoryId,
  ) {
    return FetchCategoryProjectsProvider(
      categoryId,
    );
  }

  @override
  FetchCategoryProjectsProvider getProviderOverride(
    covariant FetchCategoryProjectsProvider provider,
  ) {
    return call(
      provider.categoryId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchCategoryProjectsProvider';
}

/// See also [fetchCategoryProjects].
class FetchCategoryProjectsProvider
    extends AutoDisposeFutureProvider<CategoryModel> {
  /// See also [fetchCategoryProjects].
  FetchCategoryProjectsProvider(
    String categoryId,
  ) : this._internal(
          (ref) => fetchCategoryProjects(
            ref as FetchCategoryProjectsRef,
            categoryId,
          ),
          from: fetchCategoryProjectsProvider,
          name: r'fetchCategoryProjectsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCategoryProjectsHash,
          dependencies: FetchCategoryProjectsFamily._dependencies,
          allTransitiveDependencies:
              FetchCategoryProjectsFamily._allTransitiveDependencies,
          categoryId: categoryId,
        );

  FetchCategoryProjectsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
  }) : super.internal();

  final String categoryId;

  @override
  Override overrideWith(
    FutureOr<CategoryModel> Function(FetchCategoryProjectsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCategoryProjectsProvider._internal(
        (ref) => create(ref as FetchCategoryProjectsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CategoryModel> createElement() {
    return _FetchCategoryProjectsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCategoryProjectsProvider &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchCategoryProjectsRef on AutoDisposeFutureProviderRef<CategoryModel> {
  /// The parameter `categoryId` of this provider.
  String get categoryId;
}

class _FetchCategoryProjectsProviderElement
    extends AutoDisposeFutureProviderElement<CategoryModel>
    with FetchCategoryProjectsRef {
  _FetchCategoryProjectsProviderElement(super.provider);

  @override
  String get categoryId => (origin as FetchCategoryProjectsProvider).categoryId;
}

String _$fetchCategoryProjectsByTypeHash() =>
    r'5df832c5c86a34d80e6da2d2a7ca56ef81e87887';

/// See also [fetchCategoryProjectsByType].
@ProviderFor(fetchCategoryProjectsByType)
const fetchCategoryProjectsByTypeProvider = FetchCategoryProjectsByTypeFamily();

/// See also [fetchCategoryProjectsByType].
class FetchCategoryProjectsByTypeFamily
    extends Family<AsyncValue<CategoryModel>> {
  /// See also [fetchCategoryProjectsByType].
  const FetchCategoryProjectsByTypeFamily();

  /// See also [fetchCategoryProjectsByType].
  FetchCategoryProjectsByTypeProvider call(
    String cateId,
  ) {
    return FetchCategoryProjectsByTypeProvider(
      cateId,
    );
  }

  @override
  FetchCategoryProjectsByTypeProvider getProviderOverride(
    covariant FetchCategoryProjectsByTypeProvider provider,
  ) {
    return call(
      provider.cateId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchCategoryProjectsByTypeProvider';
}

/// See also [fetchCategoryProjectsByType].
class FetchCategoryProjectsByTypeProvider
    extends AutoDisposeFutureProvider<CategoryModel> {
  /// See also [fetchCategoryProjectsByType].
  FetchCategoryProjectsByTypeProvider(
    String cateId,
  ) : this._internal(
          (ref) => fetchCategoryProjectsByType(
            ref as FetchCategoryProjectsByTypeRef,
            cateId,
          ),
          from: fetchCategoryProjectsByTypeProvider,
          name: r'fetchCategoryProjectsByTypeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCategoryProjectsByTypeHash,
          dependencies: FetchCategoryProjectsByTypeFamily._dependencies,
          allTransitiveDependencies:
              FetchCategoryProjectsByTypeFamily._allTransitiveDependencies,
          cateId: cateId,
        );

  FetchCategoryProjectsByTypeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cateId,
  }) : super.internal();

  final String cateId;

  @override
  Override overrideWith(
    FutureOr<CategoryModel> Function(FetchCategoryProjectsByTypeRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCategoryProjectsByTypeProvider._internal(
        (ref) => create(ref as FetchCategoryProjectsByTypeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cateId: cateId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CategoryModel> createElement() {
    return _FetchCategoryProjectsByTypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCategoryProjectsByTypeProvider &&
        other.cateId == cateId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cateId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchCategoryProjectsByTypeRef
    on AutoDisposeFutureProviderRef<CategoryModel> {
  /// The parameter `cateId` of this provider.
  String get cateId;
}

class _FetchCategoryProjectsByTypeProviderElement
    extends AutoDisposeFutureProviderElement<CategoryModel>
    with FetchCategoryProjectsByTypeRef {
  _FetchCategoryProjectsByTypeProviderElement(super.provider);

  @override
  String get cateId => (origin as FetchCategoryProjectsByTypeProvider).cateId;
}

String _$categoryViewModelHash() => r'4a14193834e9c7a07b3f4568c8bab7aeab72b8a1';

/// See also [CategoryViewModel].
@ProviderFor(CategoryViewModel)
final categoryViewModelProvider =
    AutoDisposeNotifierProvider<CategoryViewModel, CategoryScreenSate>.internal(
  CategoryViewModel.new,
  name: r'categoryViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CategoryViewModel = AutoDisposeNotifier<CategoryScreenSate>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
