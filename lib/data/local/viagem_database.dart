import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class ViagemDatabase {
  static const String _viagemBoxKey = 'my_viagem_box';

  static Future<Box<Map>> initDataBase() async {
    Directory directory =
    await path_provider.getApplicationDocumentsDirectory();

    Hive.init(directory.path);
    return await Hive.openBox<Map>(_viagemBoxKey);
  }
}
