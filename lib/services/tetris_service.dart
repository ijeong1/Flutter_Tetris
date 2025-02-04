import 'package:fluttris/models/tetris_model.dart';
import 'itetris_service.dart';

class TetrisService implements ITetrisService {
  final TetrisModel _model = TetrisModel();

  @override
  void moveLeft() => _model.moveLeft();

  @override
  void moveRight() => _model.moveRight();

  @override
  void rotate() => _model.rotate();

  @override
  void drop() => _model.drop();

  @override
  void reset() => _model.reset();

  @override
  List<List<int>> get grid {
    final displayGrid = List.generate(20, (i) => List.filled(10, 0));
    for (var y = 0; y < 20; y++) {
      for (var x = 0; x < 10; x++) {
        displayGrid[y][x] = _model.grid[y][x];
      }
    }
    if (_model.currentPiece != null) {
      for (var y = 0; y < _model.currentPiece!.shape.length; y++) {
        for (var x = 0; x < _model.currentPiece!.shape[y].length; x++) {
          if (_model.currentPiece!.shape[y][x] == 1) {
            final gridX = _model.currentPiece!.x + x;
            final gridY = _model.currentPiece!.y + y;
            if (gridY >= 0 && gridX >= 0 && gridY < 20 && gridX < 10) {
              displayGrid[gridY][gridX] = 1;
            }
          }
        }
      }
    }
    return displayGrid;
  }

  @override
  int get score => _model.score;

  @override
  int get level => _model.level;

  @override
  bool get isGameOver => _model.isGameOver;
}