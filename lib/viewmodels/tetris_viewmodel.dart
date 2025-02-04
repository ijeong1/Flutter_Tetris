import 'package:fluttris/services/itetris_service.dart';

class TetrisViewModel {
  final ITetrisService _service;

  TetrisViewModel(this._service);

  void moveLeft() => _service.moveLeft();
  void moveRight() => _service.moveRight();
  void rotate() => _service.rotate();
  void drop() => _service.drop();
  void reset() => _service.reset();
  
  List<List<int>> get grid => _service.grid;
  int get score => _service.score;
  int get level => _service.level;
  bool get isGameOver => _service.isGameOver;
}