
void game() {
  noCursor();
  drawBackground();
  imageMode(CENTER);
  image(optical, mouseX, mouseY);
  
  textSize(20);
  fill(255, 255, 255);
  text("SCORE: " + score, 10, 30);
  if (score >= highscore){
    text("HIGHSCORE: " + score, 10, 50);
  }
  else {
    text("HIGHSCORE: " + highscore, 10, 50);
  }
  
  text("LIVES: " + lives, 10, 70);
  text("S. Moves: " + specials, 10, 90);

  for (bomb BOMBS : b1) {
    BOMBS.renderBomb();
  }
  for (bigBomb BIGBOMBS : b2) {
    BIGBOMBS.renderBomb();
  }
  drawWagon();
  cake1.update();

  for (flies FLIES : f1) {
    FLIES.update();
    if (detonate == true) {
      for (flies eachFly : f1) {
        score = score + 10;
        eachFly.x = random(-1500, 1500);
        eachFly.y = random(-1500, 0);
      }
      detonate = false;
    }
  }
}

void drawWagon() {
  // image(wagon1,width/2+40,height-150);
  if (counter>=0 && counter<=10) 
  {
    image(wagon1, width/2+40, height-150);
  } else if (counter>10 && counter<=20) 
  {
    image(wagon2, width/2+40, height-150);
  } else if (counter>20 && counter<=25)
  {
    image(wagon3, width/2+40, height-150);
  } else
  {
    image(wagon3, width/2+40, height-150);
    counterDir = -counterDir;
  }
  counter = counter + counterDir;

  ///////////////////////////

  /*
  if (counter >=5 && counter<=10 && !repeat) {
   image(wagon1, width/2+40, height-150);
   } else if (counter > 10 && counter<=20 && !repeat) {
   image(wagon2, width/2+40, height-150);
   } else if (counter > 20 && counter<=25 && !repeat)
   {
   image(wagon3, width/2+40, height-150);
   if (counter == 35)
   {
   repeat = !repeat;
   }
   } else if (counter <= 25 && counter > 20 && repeat)
   {
   image(wagon3, width/2+40, height-150);
   } else if (counter > 10 && counter<=20 && repeat) {
   image(wagon2, width/2+40, height-150);
   } else if (counter>=5 && counter<=10 && repeat) {
   image(wagon1, width/2+40, height-150);
   if (counter == 5)
   {
   repeat = false;
   }
   }
   if (repeat)
   counter--;
   else
   counter++;*/
}


void drawBackground() {
  imageMode(CORNER);
  image(background, bgx, 0); //draw background twice adjacent
  image(background, bgx+background.width, 0);
  bgx -=2 ;
  if (bgx == -background.width)
    bgx=0; //wrap background
}
