

import 'uri_to_file_path_platform_interface.dart';

class UriToFilePath {
	static Future<String?> getAbsolutePath(String uri) {
		return UriToFilePathPlatformInterface.instance.getAbsolutePath(uri);
	}
}
