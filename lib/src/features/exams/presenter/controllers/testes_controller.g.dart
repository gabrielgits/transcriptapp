// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testes_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllTestesHash() => r'a537069f54e34297f99d2369da7f3ed5dcfd353b';

/// See also [getAllTestes].
@ProviderFor(getAllTestes)
final getAllTestesProvider =
    AutoDisposeFutureProvider<List<TesteModel>>.internal(
  getAllTestes,
  name: r'getAllTestesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getAllTestesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAllTestesRef = AutoDisposeFutureProviderRef<List<TesteModel>>;
String _$getReportTestesHash() => r'44e8fb9115b03b2ac8c6232f73d0447488b093a8';

/// See also [getReportTestes].
@ProviderFor(getReportTestes)
final getReportTestesProvider =
    AutoDisposeFutureProvider<Map<String, dynamic>>.internal(
  getReportTestes,
  name: r'getReportTestesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getReportTestesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetReportTestesRef = AutoDisposeFutureProviderRef<Map<String, dynamic>>;
String _$startTesteHash() => r'4292119073ab8a0524a8ccc06d8a4823fc0eefda';

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

/// See also [startTeste].
@ProviderFor(startTeste)
const startTesteProvider = StartTesteFamily();

/// See also [startTeste].
class StartTesteFamily extends Family<AsyncValue<List<QuestionModel>>> {
  /// See also [startTeste].
  const StartTesteFamily();

  /// See also [startTeste].
  StartTesteProvider call(
    int testeId,
  ) {
    return StartTesteProvider(
      testeId,
    );
  }

  @override
  StartTesteProvider getProviderOverride(
    covariant StartTesteProvider provider,
  ) {
    return call(
      provider.testeId,
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
  String? get name => r'startTesteProvider';
}

/// See also [startTeste].
class StartTesteProvider
    extends AutoDisposeFutureProvider<List<QuestionModel>> {
  /// See also [startTeste].
  StartTesteProvider(
    int testeId,
  ) : this._internal(
          (ref) => startTeste(
            ref as StartTesteRef,
            testeId,
          ),
          from: startTesteProvider,
          name: r'startTesteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$startTesteHash,
          dependencies: StartTesteFamily._dependencies,
          allTransitiveDependencies:
              StartTesteFamily._allTransitiveDependencies,
          testeId: testeId,
        );

  StartTesteProvider._internal(
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
    FutureOr<List<QuestionModel>> Function(StartTesteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StartTesteProvider._internal(
        (ref) => create(ref as StartTesteRef),
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
    return _StartTesteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StartTesteProvider && other.testeId == testeId;
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
mixin StartTesteRef on AutoDisposeFutureProviderRef<List<QuestionModel>> {
  /// The parameter `testeId` of this provider.
  int get testeId;
}

class _StartTesteProviderElement
    extends AutoDisposeFutureProviderElement<List<QuestionModel>>
    with StartTesteRef {
  _StartTesteProviderElement(super.provider);

  @override
  int get testeId => (origin as StartTesteProvider).testeId;
}

String _$testesControllerHash() => r'5f3e491daa4511c76be3b245a3baf35981d165e4';

/// See also [TestesController].
@ProviderFor(TestesController)
final testesControllerProvider =
    AutoDisposeAsyncNotifierProvider<TestesController, void>.internal(
  TestesController.new,
  name: r'testesControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$testesControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TestesController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
