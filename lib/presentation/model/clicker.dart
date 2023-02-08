class Clicker {
  Clicker(int numberOfClicks):_numberOfClicks=numberOfClicks;
  
  int _numberOfClicks;

  void plus() {
    _numberOfClicks++;
  }

  int get current => _numberOfClicks;
}