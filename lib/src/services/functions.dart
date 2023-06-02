import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:path_provider/path_provider.dart';

class GlobalFunctions {
  static Future<String> downloadPath() async {
    late String path;
    if (Platform.isAndroid) {
      path = await ExternalPath.getExternalStoragePublicDirectory(
          ExternalPath.DIRECTORY_DOWNLOADS);
    } else {
      path = (await getApplicationDocumentsDirectory()).path;
    }
    return path;
  }
}
