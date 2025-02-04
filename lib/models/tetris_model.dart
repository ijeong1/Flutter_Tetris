import 'package:fluttris/models/piece.dart';

class TetrisModel {
  List<List<int>> grid = List.generate(20, (i) => List.filled(10, 0));
  int score = 0;
  int level = 1;
  bool isGameOver = false;
  Piece? currentPiece;
  List<List<List<int>>> pieces = [
    // I-piece
    [
      [1, 1, 1, 1]
    ],
    // O-piece
    [
      [1, 1],
      [1, 1]
    ],
    // T-piece
    [
      [0, 1, 0],
      [1, 1, 1]
    ],
    // S-piece
    [
      [0, 1, 1],
      [1, 1, 0]
    ],
    // Z-piece
    [
      [1, 1, 0],
      [0, 1, 1]
    ],
    // J-piece
    [
      [1, 0, 0],
      [1, 1, 1]
    ],
    // L-piece
    [
      [0, 0, 1],
      [1, 1, 1]
    ],
  ];

  TetrisModel() {
    spawnPiece();
  }

  void spawnPiece() {
    if (isGameOver) return;
    final random = DateTime.now().millisecond % pieces.length;
    currentPiece = Piece(pieces[random], x: 4, y: 0);
    if (_checkCollision(currentPiece!)) {
      isGameOver = true;
    }
  }

  bool _checkCollision(Piece piece) {
    for (var y = 0; y < piece.shape.length; y++) {
      for (var x = 0; x < piece.shape[y].length; x++) {
        if (piece.shape[y][x] == 1) {
          final gridX = piece.x + x;
          final gridY = piece.y + y;
          if (gridX < 0 || gridX >= 10 || gridY >= 20 || (gridY >= 0 && grid[gridY][gridX] == 1)) {
            return true;
          }
        }
      }
    }
    return false;
  }

  void mergePiece() {
    if (currentPiece == null) return;
    for (var y = 0; y < currentPiece!.shape.length; y++) {
      for (var x = 0; x < currentPiece!.shape[y].length; x++) {
        if (currentPiece!.shape[y][x] == 1) {
          final gridX = currentPiece!.x + x;
          final gridY = currentPiece!.y + y;
          if (gridY >= 0 && gridX >= 0) {
            grid[gridY][gridX] = 1;
          }
        }
      }
    }
    _clearLines();
    spawnPiece();
  }

  void _clearLines() {
    int linesCleared = 0;
    for (var y = grid.length - 1; y >= 0; y--) {
      if (grid[y].every((cell) => cell == 1)) {
        grid.removeAt(y);
        grid.insert(0, List.filled(10, 0));
        linesCleared++;
      }
    }
    score += linesCleared * 100;
    level = (score ~/ 500) + 1; // Increase level every 500 points
  }

  void moveLeft() {
    if (currentPiece == null || isGameOver) return;
    final newPiece = currentPiece!.clone();
    newPiece.x--;
    if (!_checkCollision(newPiece)) {
      currentPiece = newPiece;
    }
  }

  void moveRight() {
    if (currentPiece == null || isGameOver) return;
    final newPiece = currentPiece!.clone();
    newPiece.x++;
    if (!_checkCollision(newPiece)) {
      currentPiece = newPiece;
    }
  }

  void rotate() {
    if (currentPiece == null || isGameOver) return;
    final newPiece = currentPiece!.clone();
    newPiece.shape = _rotatePiece(newPiece.shape);
    if (!_checkCollision(newPiece)) {
      currentPiece = newPiece;
    }
  }

  List<List<int>> _rotatePiece(List<List<int>> piece) {
    final rotated = List.generate(piece[0].length, (i) => List<int>.filled(piece.length, 0));
    for (var y = 0; y < piece.length; y++) {
      for (var x = 0; x < piece[y].length; x++) {
        rotated[x][piece.length - 1 - y] = piece[y][x];
      }
    }
    return rotated;
  }

  void drop() {
    if (currentPiece == null || isGameOver) return;
    while (!_checkCollision(currentPiece!)) {
      currentPiece!.y++;
    }
    currentPiece!.y--;
    mergePiece();
  }

  void reset() {
    grid = List.generate(20, (i) => List.filled(10, 0));
    score = 0;
    level = 1;
    isGameOver = false;
    spawnPiece();
  }
}