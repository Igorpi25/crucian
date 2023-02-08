import 'package:crucian/presentation/model/clicker.dart';

abstract class Repository {
  Future<Clicker> load();
  void save(Clicker clicker);
}