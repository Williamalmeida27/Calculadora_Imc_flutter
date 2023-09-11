import 'package:hive/hive.dart';

part 'imc_model.g.dart';

@HiveType(typeId: 1)
class ImcModel extends HiveObject {
  @HiveField(0)
  String _tipo = "";

  @HiveField(1)
  double _categoria = 0;
}
