import 'package:crucian/presentation/view/home_page.dart';
import 'package:crucian/presentation/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(viewmodel: _homeViewmodel()),
    );
  }

  HomeViewmodel _homeViewmodel() => HomeViewmodel(title: 'Flutter Demo Home Page', counter: 0);
}
