// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchProjectTypesHash() => r'1e3c27a7a7055c99ef7f97230c4ea8b53078511b';

/// See also [fetchProjectTypes].
@ProviderFor(fetchProjectTypes)
final fetchProjectTypesProvider =
    AutoDisposeFutureProvider<List<ProjectType>>.internal(
  fetchProjectTypes,
  name: r'fetchProjectTypesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchProjectTypesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchProjectTypesRef = AutoDisposeFutureProviderRef<List<ProjectType>>;
String _$projectViewModelHash() => r'8bac02de136e624aaf67351213f7f23d11aff4ab';

/// See also [ProjectViewModel].
@ProviderFor(ProjectViewModel)
final projectViewModelProvider =
    AutoDisposeNotifierProvider<ProjectViewModel, ProjectItemModel?>.internal(
  ProjectViewModel.new,
  name: r'projectViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProjectViewModel = AutoDisposeNotifier<ProjectItemModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
