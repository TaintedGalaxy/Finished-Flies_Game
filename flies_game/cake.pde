class cake {
  float x;
  float y;
  PImage cake;

  cake(float x, float y, PImage cake) {
    this.x = x;
    this.y = y;
    this.cake = cake;
  }

  void update() {
    render();
    hit();
  }

  boolean hit() {
    if (dist(x-20, y-20, x+20, y+20) < 40) {
      return true;
    } else {
      return false;
    }
  }

  void render() {
    image(cake, x, y, 80, 80);
  }
}
