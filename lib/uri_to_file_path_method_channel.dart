import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

import 'uri_to_file_path_platform_interface.dart';

/// An implementation of [UriToFilePathPlatformInterface] that uses method channels.
class MethodChannelUriToFilePath extends UriToFilePathPlatformInterface {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('uri_to_file_path');

	@override
  Future<String?> getAbsolutePath(String uri) async {
		if(await Permission.storage.request().isDenied) return null;
		return methodChannel.invokeMethod<String>("getAbsolutePath", {"uri": uri});
  }
}
