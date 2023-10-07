
Die[] dice = new Die[9];

void setup() {
  size(600, 600);
  background(15,93,38);
  for (int i = 0; i < dice.length; i++) {
    int x = (i % 3) * 200 + 50;
    int y = (i / 3) * 200 + 50;
    dice[i] = new Die(x, y);
  }
}

void draw() {
  for (Die die : dice) {
    die.show();
  }
}

void mousePressed() {
  int totalPips = 0;
  for (Die die : dice) {
    die.roll();
    totalPips += die.getPips();
  }
  
  background(15,93,38);
  fill(0);
  textSize(20);
  textAlign(RIGHT, TOP);
  text("Total Pips:" + totalPips, width -10, 10);
}

class Die {//member variable dec
  int myX, myY, mySize;
  int pips;
  
  int getPips(){
    return pips;
  }


  Die(int x, int y) {//constructor
    mySize = 50;
    myX = x;
    myY = y;
    pips = 1;  // initial pip #
    
   
  }

  void roll() {
    pips = (int)(Math.random() * 6) + 1;  // random pip generator
  }

  void show() {
    rectMode(CENTER);
    stroke(0);
    fill(255);
    rect(myX, myY, mySize, mySize, 10);
    fill(0);
    int dotSize = 10;
    float spacing = mySize / 4.0;
    switch (pips) {
      case 1:
        ellipse(myX, myY, dotSize, dotSize);
        break;
      case 2:
        ellipse(myX - spacing, myY - spacing, dotSize, dotSize);
        ellipse(myX + spacing, myY + spacing, dotSize, dotSize);
        break;
      case 3:
        ellipse(myX - spacing, myY - spacing, dotSize, dotSize);
        ellipse(myX, myY, dotSize, dotSize);
        ellipse(myX + spacing, myY + spacing, dotSize, dotSize);
        break;
      case 4:
        ellipse(myX - spacing, myY - spacing, dotSize, dotSize);
        ellipse(myX + spacing, myY - spacing, dotSize, dotSize);
        ellipse(myX - spacing, myY + spacing, dotSize, dotSize);
        ellipse(myX + spacing, myY + spacing, dotSize, dotSize);
        break;
      case 5:
        ellipse(myX - spacing, myY - spacing, dotSize, dotSize);
        ellipse(myX + spacing, myY - spacing, dotSize, dotSize);
        ellipse(myX, myY, dotSize, dotSize);
        ellipse(myX - spacing, myY + spacing, dotSize, dotSize);
        ellipse(myX + spacing, myY + spacing, dotSize, dotSize);
        break;
      case 6:
        ellipse(myX - spacing, myY - spacing, dotSize, dotSize);
        ellipse(myX + spacing, myY - spacing, dotSize, dotSize);
        ellipse(myX - spacing, myY, dotSize, dotSize);
        ellipse(myX + spacing, myY, dotSize, dotSize);
        ellipse(myX - spacing, myY + spacing, dotSize, dotSize);
        ellipse(myX + spacing, myY + spacing, dotSize, dotSize);
        break;
      default:
        break;
    }
  }
}
