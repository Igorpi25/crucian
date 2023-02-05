class HomeViewmodel {
  int counter;
  final String title;
  
  HomeViewmodel({required this.title, required this.counter});
  
  void plus() {
    counter ++;
  }

}