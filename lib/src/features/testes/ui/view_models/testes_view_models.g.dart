// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testes_view_models.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllTestesViewModelHash() =>
    r'7160e40fe782c4fc5e26f63fe8be7c436f29b2b8';

/// See also [getAllTestesViewModel].
@ProviderFor(getAllTestesViewModel)
final getAllTestesViewModelProvider =
    AutoDisposeFutureProvider<List<TesteModel>>.internal(
  getAllTestesViewModel,
  name: r'getAllTestesViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllTestesViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAllTestesViewModelRef
    = AutoDisposeFutureProviderRef<List<TesteModel>>;
String _$getReportTestesViewModelHash() =>
    r'1a2aed274bee231e46c90e518f7a96a1b01576b8';

/// See also [getReportTestesViewModel].
@ProviderFor(getReportTestesViewModel)
final getReportTestesViewModelProvider =
    AutoDisposeFutureProvider<TesteReportModel>.internal(
  getReportTestesViewModel,
  name: r'getReportTestesViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getReportTestesViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetReportTestesViewModelRef
    = AutoDisposeFutureProviderRef<TesteReportModel>;
String _$startTesteViewModelHash() =>
    r'81c9816bc3c724e07d8ae243ab22db5dea9245c8';

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

/// See also [startTesteViewModel].
@ProviderFor(startTesteViewModel)
const startTesteViewModelProvider = StartTesteViewModelFamily();

/// See also [startTesteViewModel].
class StartTesteViewModelFamily
    extends Family<AsyncValue<List<QuestionModel>>> {
  /// See also [startTesteViewModel].
  const StartTesteViewModelFamily();

  /// See also [startTesteViewModel].
  StartTesteViewModelProvider call({
    required int testeId,
  }) {
    return StartTesteViewModelProvider(
      testeId: testeId,
    );
  }

  @override
  StartTesteViewModelProvider getProviderOverride(
    covariant StartTesteViewModelProvider provider,
  ) {
    return call(
      testeId: provider.testeId,
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
  String? get name => r'startTesteViewModelProvider';
}

/// See also [startTesteViewModel].
class StartTesteViewModelProvider
    extends AutoDisposeFutureProvider<List<QuestionModel>> {
  /// See also [startTesteViewModel].
  StartTesteViewModelProvider({
    required int testeId,
  }) : this._internal(
          (ref) => startTesteViewModel(
            ref as StartTesteViewModelRef,
            testeId: testeId,
          ),
          from: startTesteViewModelProvider,
          name: r'startTesteViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$startTesteViewModelHash,
          dependencies: StartTesteViewModelFamily._dependencies,
          allTransitiveDependencies:
              StartTesteViewModelFamily._allTransitiveDependencies,
          testeId: testeId,
        );

  StartTesteViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.testeId,
  }) : super.internal();

  final int testeId;

  @override
  Override overrideWith(
    FutureOr<List<QuestionModel>> Function(StartTesteViewModelRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StartTesteViewModelProvider._internal(
        (ref) => create(ref as StartTesteViewModelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        testeId: testeId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<QuestionModel>> createElement() {
    return _StartTesteViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StartTesteViewModelProvider && other.testeId == testeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, testeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StartTesteViewModelRef
    on AutoDisposeFutureProviderRef<List<QuestionModel>> {
  /// The parameter `testeId` of this provider.
  int get testeId;
}

class _StartTesteViewModelProviderElement
    extends AutoDisposeFutureProviderElement<List<QuestionModel>>
    with StartTesteViewModelRef {
  _StartTesteViewModelProviderElement(super.provider);

  @override
  int get testeId => (origin as StartTesteViewModelProvider).testeId;
}

String _$testesViewModelHash() => r'78ada4b7a9b47087b914df87f4266f06e831202e';

/// See also [TestesViewModel].
@ProviderFor(TestesViewModel)
final testesViewModelProvider =
    AutoDisposeAsyncNotifierProvider<TestesViewModel, void>.internal(
  TestesViewModel.new,
  name: r'testesViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$testesViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TestesViewModel = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
