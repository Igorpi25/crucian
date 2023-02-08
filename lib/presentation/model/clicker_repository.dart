import 'package:crucian/presentation/model/clicker.dart';

abstract class ClickerRepository {
  Future<Clicker> load();
  void save(Clicker clicker);
}