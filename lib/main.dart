import 'dart:developer';

import 'package:crucian/presentation/app.dart';
import 'package:crucian/presentation/boundary/incoming.dart';
import 'package:crucian/presentation/boundary/outgoing.dart';
import 'package:flutter/material.dart';

void main() {

  final UpdateService updateService = UpdateService();
  final MockService mockService = MockService(updateBoundary: updateService);


  final App app = App(incrementBoundary: mockService, loadInitialBoundary: mockService);
  debugPrint('add listener');
  updateService.add(app.updateListener);

  runApp(app);
}

class MockService implements LoadInitialBoundary, IncrementBoundary {
  final UpdateBoundary updateBoundary;

  int current = 0;

  MockService({required this.updateBoundary});

  @override
  void increment() {
    debugPrint('increment');
    updateBoundary.updateValue(++current);
  }

  @override
  void loadInitial() {
    debugPrint('loadInitial');
    updateBoundary.updateValue(current);
  }

}

class UpdateService implements UpdateBoundary {
  final List<UpdateListener> listeners = [];

  void add(UpdateListener listener) {
    listeners.add(listener);
  }
  
  @override
  void updateValue(int newValue) {
    for (var element in listeners) {
      element.onUpdate(newValue);
    }
  }

}