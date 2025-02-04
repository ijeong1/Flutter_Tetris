class Piece {
  List<List<int>> shape;
  int x;
  int y;

  Piece(this.shape, {this.x = 0, this.y = 0});

  Piece clone() {
    return Piece(
      shape.map((row) => List<int>.from(row)).toList(),
      x: x,
      y: y,
    );
  }
}