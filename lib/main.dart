import 'dart:developer';

import 'package:crucian/presentation/app.dart';
import 'package:crucian/presentation/boundary/repository.dart';
import 'package:crucian/presentation/model/clicker.dart';
import 'package:flutter/material.dart';

void main() {
  final MockRepository repo = MockRepository();

  runApp(App(repository: repo));
}

class MockRepository implements Repository{
  @override
  Future<Clicker> load() {
    return Future.delayed(const Duration(seconds: 1), ()=> Clicker(2));
  }

  @override
  void save(Clicker clicker) {
    log('MockRepository save $clicker');
  }

}