class flies {
  float x, y;
  PImage fly1, fly2, fly3, fly4;
  int counter;
  int countDir;
  boolean repeat;

  flies() {
    this.x = random(-1000, 1000);
    this.y = random(-1000, 0);
    this.counter = 5;
    this.countDir = 1;
    this.fly1 = loadImage("1.png");
    this.fly2 = loadImage("2.png");
    this.fly3 = loadImage("3.png");
    this.fly4 = loadImage("4.png");
    this.repeat = false;
  }

  private void update() {
    movement();
    render();
    checkFinish();
  }

  private void checkFinish() {
    if (x >= 410 && x <= 500 && y >= 625 && y <= 720) {
      x = random(-1000, 1000);
      y = random(-1000, 0);
      lives--;
      if (lives <= 0) {
        String[] lines = loadStrings("scores.txt");
        if (Integer.parseInt(lines[0]) < score)
        {
          String[] list = split(str(score), ' ');
          saveStrings("scores.txt", list);
        }
        mode = 3;
      }
    }
  }

  private void movement() {
    x = lerp(x, width/2, 0.003);
    y = lerp(y, height-150, 0.003);
  }

  public void render() {
    imageMode(CENTER);
    if (counter >=5 && counter<=10 && !repeat) {
      image(fly1, x, y);
    } else if (counter > 10 && counter<=20 && !repeat) {
      image(fly2, x, y);
    } else if (counter > 20 && counter<=30 && !repeat)
    {
      image(fly3, x, y);
    } else if (counter > 30 && counter<=35 && !repeat)
    {
      image(fly4, x, y);
      if (counter == 35)
      {
        repeat = !repeat;
      }
    } else if (counter <= 35 && counter > 30 && repeat)
    {
      image(fly4, x, y);
    } else if (counter > 20 && counter<=30 && repeat)
    {
      image(fly3, x, y);
    } else if (counter > 10 && counter<=20 && repeat) {
      image(fly2, x, y);
    } else if (counter>=5 && counter<=10 && repeat) {
      image(fly1, x, y);
      if (counter == 5)
      {
        repeat = false;
      }
    }
    if (repeat)
      counter--;
    else
      counter++;
  }

  Boolean hit() {
    if (dist(mouseX, mouseY, x, y) < 30) {
      return true;
    } else {
      return false;
    }
  }
}
