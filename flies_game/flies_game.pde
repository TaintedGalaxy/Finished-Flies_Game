int mode = 1; // 1: intro, 2: game playing, 3: gameover
int score = 0;
int lives = 3;
int specials = 5;
int highscore;
int bgx;
int counter = 5;
int counterDir = 1;
boolean repeat = false;
boolean detonate = false;

PImage background;
PImage cake;
PImage bomb1, bomb2, bomb3, bomb4, bomb5, bomb6, bomb7, bomb8, bomb9;
PImage fly1, fly2, fly3, fly4;
PImage wagon1, wagon2, wagon3;
PImage optical;
cake cake1;

Boolean isMouseClicked = false;
ArrayList<bomb> b1;
ArrayList<bigBomb> b2;
ArrayList<flies> f1;
ArrayList<flies> Flies = new ArrayList<flies>();


void setup() {
  size(900, 900);
  background = loadImage("Background.jpg");
  wagon1 = loadImage("horse1.png");
  wagon2 = loadImage("horse2.png");
  wagon3 = loadImage("horse3.png");
  optical = loadImage("Optical.png");
  optical.resize(100, 100);
  background.resize(width, height);
  cake1 = new cake(width/2, height-220, loadImage("Cake.png"));

  String[] lines = loadStrings("scores.txt");
  highscore = Integer.parseInt(lines[0]);

  b1 = new ArrayList<bomb>();
  b2 = new ArrayList<bigBomb>();
  f1 = new ArrayList<flies>();
  f1.add(new flies());
  for (int i = 0; i < 30; i++) {
    f1.add(new flies());
  }
}

boolean overStart() {
  if (mouseX >= 350 && mouseX <= 550 && 
    mouseY >= 400 && mouseY <= 450) {
    return true;
  } else {
    return false;
  }
}

boolean overRestart() {
  if (mouseX >= 320 && mouseX <= 580 && 
    mouseY >= 400 && mouseY <= 450) {
    return true;
  } else {
    return false;
  }
}

boolean overExit() {
  if (mouseX >= 380 && mouseX <= 515 && 
    mouseY >= 480 && mouseY <= 530) {
    return true;
  } else {
    return false;
  }
}

void draw() {
  if (mode == 1) {
    background(25, 25, 25);
    textSize(32);
    fill(245, 245, 245);
    text("Don't let the flies get to your cake! Blow them", 80, 100);
    text("up using the bombs we've given you. You have", 80, 140);
    text("3 lives and 5 special moves. Use them wisely.", 80, 180);
    text("Hopefully you succeed.", 80, 220);
    textAlign(CENTER);
    text("Current Highscore: " + highscore, width/2, height/2-130);
    textSize(60);
    if (overStart()){
      fill(125);
    }
    text("START", width/2, height/2);
    fill(245, 245, 245);
    if (overExit()) {
      fill(125);
    }
    text("EXIT", width/2, height/2 + 80);
    textAlign(LEFT);
  } else if (mode == 2) {
    game();
  } else if (mode == 3) {
    background(25, 25, 25);
    textSize(32);
    fill(255, 245, 245);
    text("Unlucky! You've lost 3 lives and died! ", 80, 100);
    text("Better luck next time. ", 80, 140);
    textAlign(CENTER);
    text("SCORE: " + score, width/2, height/2-100);
    text("Current Highscore: " + highscore, width/2, height/2-160);
    textSize(60);
    if (overRestart()) {
      fill(125);
    }
    text("RESTART", width/2, height/2);
    fill(255, 245, 245);
    if (overExit()) {
      fill(125);
    }
    text("EXIT", width/2, height/2 + 80);
    fill(255, 245, 245);
    textAlign(LEFT);
  }
}

void Boom() {
  b1.add(new bomb());
}

void bigBoom() {
  b2.add(new bigBomb());
  specials--;
  detonate = true;
}

void mouse() {
  if (mouseButton == LEFT) {
    Boom();
    isMouseClicked = true;
  } else if (mouseButton == RIGHT) {
    if (specials >= 1) {
      bigBoom();
      //f1.x = 1;
    }
  }
}

void mouseReleased() {
  if (mode == 1) {
    // Handles clicks in the intro screen
    
    if (overRestart()){
      mode = 2;
    }
    if (overExit()){
      exit();
    }
  } else if (mode == 2) {
    // Handles clicks in-game
    // gameClick();
    mouse();
    for (flies FLIES : f1) {
      if (FLIES.hit()) {
        score = score + 10;
        FLIES.x = random(-1000, 1000);
        FLIES.y = random(-1000, 0);
      }
    }
  } else if (mode == 3) {
    // Handles clicks in the game over screen
    if (overRestart()) {
      score = 0;
      lives = 3;
      specials = 5;
      for (flies FLIES : f1) {
        FLIES.x = random(-1000, 1000);
        FLIES.y = random(-1000, 0);
      }
      String[] lines = loadStrings("scores.txt");
      highscore = Integer.parseInt(lines[0]);
      mode = 2;
    }
    if (overExit()){
      exit();
    }
  }
}
