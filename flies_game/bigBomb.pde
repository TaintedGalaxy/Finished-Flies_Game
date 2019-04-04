class bigBomb {
  PImage bomb1, bomb2, bomb3, bomb4, bomb5, bomb6, bomb7, bomb8, bomb9;
  int counter;
  int x, y;
  int size;

  bigBomb() {
    this.x = mouseX;
    this.y = mouseY;
    this.bomb1 = loadImage("bomb1.png");
    this.bomb2 = loadImage("bomb2.png");
    this.bomb3 = loadImage("bomb3.png");
    this.bomb4 = loadImage("bomb4.png");
    this.bomb5 = loadImage("bomb5.png");
    this.bomb6 = loadImage("bomb6.png");
    this.bomb7 = loadImage("bomb7.png");
    this.bomb8 = loadImage("bomb8.png");
    this.bomb9 = loadImage("bomb9.png");
  }

  void renderBomb() {
    imageMode(CENTER);
    if (counter>=0 && counter<=10) 
    {
      image(bomb1, width/2, height/2, 900, 900);
    } else if (counter>10 && counter<=20) 
    {
      image(bomb2, width/2, height/2, 900, 900);
    } else if (counter>20 && counter<=30)
    {
      image(bomb3, width/2, height/2, 900, 900);
    } else if (counter>30 && counter<=40)
    {
      image(bomb4, width/2, height/2, 900, 900);
    } else if (counter>40 && counter<=50) 
    {
      image(bomb5, width/2, height/2, 900, 900);
    } else if (counter>50 && counter<=60)
    {
      image(bomb6, width/2, height/2, 900, 900);
    } else if (counter>60 && counter<=70) 
    {
      image(bomb7, width/2, height/2, 900, 900);
    } else if (counter>70 && counter<=80)
    {
      image(bomb8, width/2, height/2, 900, 900);
    } else if (counter>80 && counter<=90) 
    {
      image(bomb9, width/2, height/2, 900, 900);
    } else
    {
    }
    counter++;
  }
}
