// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllNotificationsViewModelHash() =>
    r'7727476ec0e8fb4bc5b189f21f2518293910ef94';

/// See also [getAllNotificationsViewModel].
@ProviderFor(getAllNotificationsViewModel)
final getAllNotificationsViewModelProvider =
    AutoDisposeFutureProvider<List<NotificationModel>>.internal(
  getAllNotificationsViewModel,
  name: r'getAllNotificationsViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllNotificationsViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAllNotificationsViewModelRef
    = AutoDisposeFutureProviderRef<List<NotificationModel>>;
String _$getNotificationViewModelHash() =>
    r'5c01ea2c30c875a036e26f3c6ddf39a4622af8a5';

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

/// See also [getNotificationViewModel].
@ProviderFor(getNotificationViewModel)
const getNotificationViewModelProvider = GetNotificationViewModelFamily();

/// See also [getNotificationViewModel].
class GetNotificationViewModelFamily
    extends Family<AsyncValue<NotificationModel>> {
  /// See also [getNotificationViewModel].
  const GetNotificationViewModelFamily();

  /// See also [getNotificationViewModel].
  GetNotificationViewModelProvider call(
    int id,
  ) {
    return GetNotificationViewModelProvider(
      id,
    );
  }

  @override
  GetNotificationViewModelProvider getProviderOverride(
    covariant GetNotificationViewModelProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'getNotificationViewModelProvider';
}

/// See also [getNotificationViewModel].
class GetNotificationViewModelProvider
    extends AutoDisposeFutureProvider<NotificationModel> {
  /// See also [getNotificationViewModel].
  GetNotificationViewModelProvider(
    int id,
  ) : this._internal(
          (ref) => getNotificationViewModel(
            ref as GetNotificationViewModelRef,
            id,
          ),
          from: getNotificationViewModelProvider,
          name: r'getNotificationViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getNotificationViewModelHash,
          dependencies: GetNotificationViewModelFamily._dependencies,
          allTransitiveDependencies:
              GetNotificationViewModelFamily._allTransitiveDependencies,
          id: id,
        );

  GetNotificationViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<NotificationModel> Function(GetNotificationViewModelRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetNotificationViewModelProvider._internal(
        (ref) => create(ref as GetNotificationViewModelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<NotificationModel> createElement() {
    return _GetNotificationViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetNotificationViewModelProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetNotificationViewModelRef
    on AutoDisposeFutureProviderRef<NotificationModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetNotificationViewModelProviderElement
    extends AutoDisposeFutureProviderElement<NotificationModel>
    with GetNotificationViewModelRef {
  _GetNotificationViewModelProviderElement(super.provider);

  @override
  int get id => (origin as GetNotificationViewModelProvider).id;
}

String _$deleteNotificationViewModelHash() =>
    r'767da25a711110fd9a563406961b4fd673ca6490';

/// See also [deleteNotificationViewModel].
@ProviderFor(deleteNotificationViewModel)
const deleteNotificationViewModelProvider = DeleteNotificationViewModelFamily();

/// See also [deleteNotificationViewModel].
class DeleteNotificationViewModelFamily
    extends Family<AsyncValue<NotificationModel>> {
  /// See also [deleteNotificationViewModel].
  const DeleteNotificationViewModelFamily();

  /// See also [deleteNotificationViewModel].
  DeleteNotificationViewModelProvider call(
    int id,
  ) {
    return DeleteNotificationViewModelProvider(
      id,
    );
  }

  @override
  DeleteNotificationViewModelProvider getProviderOverride(
    covariant DeleteNotificationViewModelProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'deleteNotificationViewModelProvider';
}

/// See also [deleteNotificationViewModel].
class DeleteNotificationViewModelProvider
    extends AutoDisposeFutureProvider<NotificationModel> {
  /// See also [deleteNotificationViewModel].
  DeleteNotificationViewModelProvider(
    int id,
  ) : this._internal(
          (ref) => deleteNotificationViewModel(
            ref as DeleteNotificationViewModelRef,
            id,
          ),
          from: deleteNotificationViewModelProvider,
          name: r'deleteNotificationViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteNotificationViewModelHash,
          dependencies: DeleteNotificationViewModelFamily._dependencies,
          allTransitiveDependencies:
              DeleteNotificationViewModelFamily._allTransitiveDependencies,
          id: id,
        );

  DeleteNotificationViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<NotificationModel> Function(
            DeleteNotificationViewModelRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteNotificationViewModelProvider._internal(
        (ref) => create(ref as DeleteNotificationViewModelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<NotificationModel> createElement() {
    return _DeleteNotificationViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteNotificationViewModelProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteNotificationViewModelRef
    on AutoDisposeFutureProviderRef<NotificationModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DeleteNotificationViewModelProviderElement
    extends AutoDisposeFutureProviderElement<NotificationModel>
    with DeleteNotificationViewModelRef {
  _DeleteNotificationViewModelProviderElement(super.provider);

  @override
  int get id => (origin as DeleteNotificationViewModelProvider).id;
}

String _$createNotificationViewModelHash() =>
    r'1a544280e39d3f7536f954ddd9c956099c702905';

/// See also [createNotificationViewModel].
@ProviderFor(createNotificationViewModel)
const createNotificationViewModelProvider = CreateNotificationViewModelFamily();

/// See also [createNotificationViewModel].
class CreateNotificationViewModelFamily
    extends Family<AsyncValue<NotificationModel>> {
  /// See also [createNotificationViewModel].
  const CreateNotificationViewModelFamily();

  /// See also [createNotificationViewModel].
  CreateNotificationViewModelProvider call(
    NotificationModel notification,
  ) {
    return CreateNotificationViewModelProvider(
      notification,
    );
  }

  @override
  CreateNotificationViewModelProvider getProviderOverride(
    covariant CreateNotificationViewModelProvider provider,
  ) {
    return call(
      provider.notification,
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
  String? get name => r'createNotificationViewModelProvider';
}

/// See also [createNotificationViewModel].
class CreateNotificationViewModelProvider
    extends AutoDisposeFutureProvider<NotificationModel> {
  /// See also [createNotificationViewModel].
  CreateNotificationViewModelProvider(
    NotificationModel notification,
  ) : this._internal(
          (ref) => createNotificationViewModel(
            ref as CreateNotificationViewModelRef,
            notification,
          ),
          from: createNotificationViewModelProvider,
          name: r'createNotificationViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createNotificationViewModelHash,
          dependencies: CreateNotificationViewModelFamily._dependencies,
          allTransitiveDependencies:
              CreateNotificationViewModelFamily._allTransitiveDependencies,
          notification: notification,
        );

  CreateNotificationViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.notification,
  }) : super.internal();

  final NotificationModel notification;

  @override
  Override overrideWith(
    FutureOr<NotificationModel> Function(
            CreateNotificationViewModelRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateNotificationViewModelProvider._internal(
        (ref) => create(ref as CreateNotificationViewModelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        notification: notification,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<NotificationModel> createElement() {
    return _CreateNotificationViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateNotificationViewModelProvider &&
        other.notification == notification;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, notification.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CreateNotificationViewModelRef
    on AutoDisposeFutureProviderRef<NotificationModel> {
  /// The parameter `notification` of this provider.
  NotificationModel get notification;
}

class _CreateNotificationViewModelProviderElement
    extends AutoDisposeFutureProviderElement<NotificationModel>
    with CreateNotificationViewModelRef {
  _CreateNotificationViewModelProviderElement(super.provider);

  @override
  NotificationModel get notification =>
      (origin as CreateNotificationViewModelProvider).notification;
}

String _$updateNotificationViewModelHash() =>
    r'e4cba9031a54fcb17fface44501ff0097eb8cfef';

/// See also [updateNotificationViewModel].
@ProviderFor(updateNotificationViewModel)
const updateNotificationViewModelProvider = UpdateNotificationViewModelFamily();

/// See also [updateNotificationViewModel].
class UpdateNotificationViewModelFamily
    extends Family<AsyncValue<NotificationModel>> {
  /// See also [updateNotificationViewModel].
  const UpdateNotificationViewModelFamily();

  /// See also [updateNotificationViewModel].
  UpdateNotificationViewModelProvider call(
    NotificationModel notification,
  ) {
    return UpdateNotificationViewModelProvider(
      notification,
    );
  }

  @override
  UpdateNotificationViewModelProvider getProviderOverride(
    covariant UpdateNotificationViewModelProvider provider,
  ) {
    return call(
      provider.notification,
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
  String? get name => r'updateNotificationViewModelProvider';
}

/// See also [updateNotificationViewModel].
class UpdateNotificationViewModelProvider
    extends AutoDisposeFutureProvider<NotificationModel> {
  /// See also [updateNotificationViewModel].
  UpdateNotificationViewModelProvider(
    NotificationModel notification,
  ) : this._internal(
          (ref) => updateNotificationViewModel(
            ref as UpdateNotificationViewModelRef,
            notification,
          ),
          from: updateNotificationViewModelProvider,
          name: r'updateNotificationViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateNotificationViewModelHash,
          dependencies: UpdateNotificationViewModelFamily._dependencies,
          allTransitiveDependencies:
              UpdateNotificationViewModelFamily._allTransitiveDependencies,
          notification: notification,
        );

  UpdateNotificationViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.notification,
  }) : super.internal();

  final NotificationModel notification;

  @override
  Override overrideWith(
    FutureOr<NotificationModel> Function(
            UpdateNotificationViewModelRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateNotificationViewModelProvider._internal(
        (ref) => create(ref as UpdateNotificationViewModelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        notification: notification,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<NotificationModel> createElement() {
    return _UpdateNotificationViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateNotificationViewModelProvider &&
        other.notification == notification;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, notification.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateNotificationViewModelRef
    on AutoDisposeFutureProviderRef<NotificationModel> {
  /// The parameter `notification` of this provider.
  NotificationModel get notification;
}

class _UpdateNotificationViewModelProviderElement
    extends AutoDisposeFutureProviderElement<NotificationModel>
    with UpdateNotificationViewModelRef {
  _UpdateNotificationViewModelProviderElement(super.provider);

  @override
  NotificationModel get notification =>
      (origin as UpdateNotificationViewModelProvider).notification;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
