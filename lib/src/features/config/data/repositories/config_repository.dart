import 'package:transcriptapp/src/utils/result.dart';

import '../../domain/models/config_model.dart';

/// Repository for Configuration data
/// An abstract repository interface for managing configuration data.
/// Provides methods to interact with ConfigModel items in a data store.
abstract class ConfigRepository {
  /// Retrieves a configuration by its ID.
  ///
  /// [id] is the identifier of the configuration to retrieve.
  /// 
  /// Returns a [Future] that completes with a [Result] containing the
  /// requested [ConfigModel] item, or an error if the operation fails.
  Future<Result<ConfigModel>> getConfig();

  /// Updates an existing configuration.
  ///
  /// [config] is the [ConfigModel] containing updated data.
  /// 
  /// Returns a [Future] that completes with a [Result] containing the
  /// number of affected records, or an error if the operation fails.
  Future<Result<int>> updateConfig(ConfigModel config);

  /// Saves a new configuration.
  ///
  /// [config] is the [ConfigModel] to be saved.
  /// 
  /// Returns a [Future] that completes with a [Result] containing the
  /// ID of the saved configuration, or an error if the operation fails.
  Future<Result<int>> saveConfig(ConfigModel config);
}
