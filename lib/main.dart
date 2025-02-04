import 'package:flutter/material.dart';
import 'package:fluttris/services/itetris_service.dart';
import 'package:fluttris/services/tetris_service.dart';
import 'package:fluttris/viewmodels/tetris_viewmodel.dart';
import 'package:fluttris/views/tetris_view.dart';
import 'package:get_it/get_it.dart';

void setupLocator() {
  GetIt.I.registerSingleton<ITetrisService>(TetrisService());
}

// Entry point of the application
void main() {
   setupLocator();
  runApp(TetrisGame());
}

class TetrisGame extends StatelessWidget {
  const TetrisGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tetris',
      home: TetrisView(
        viewModel: TetrisViewModel(GetIt.I<ITetrisService>()),
      ),
    );
  }
}