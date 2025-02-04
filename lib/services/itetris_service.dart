abstract class ITetrisService {
  void moveLeft();
  void moveRight();
  void rotate();
  void drop();
  void reset();
  List<List<int>> get grid;
  int get score;
  int get level;
  bool get isGameOver;
}