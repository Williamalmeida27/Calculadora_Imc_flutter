import 'package:flutter/material.dart';
import 'package:imcapp/model/pessoa_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  Hive.registerAdapter(PessoaModelAdapter());
  runApp(const MyApp());
}
