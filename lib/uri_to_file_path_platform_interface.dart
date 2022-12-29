import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'uri_to_file_path_method_channel.dart';

abstract class UriToFilePathPlatformInterface extends PlatformInterface {
  /// Constructs a UriToFilePathPlatform.
  UriToFilePathPlatformInterface() : super(token: _token);

  static final Object _token = Object();

  static UriToFilePathPlatformInterface _instance = MethodChannelUriToFilePath();

  /// The default instance of [UriToFilePathPlatformInterface] to use.
  ///
  /// Defaults to [MethodChannelUriToFilePath].
  static UriToFilePathPlatformInterface get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UriToFilePathPlatformInterface] when
  /// they register themselves.
  static set instance(UriToFilePathPlatformInterface instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

	Future<String?> getAbsolutePath(String uri) {
    throw UnimplementedError('platformVersion() has not been implemented.');
	}
}
