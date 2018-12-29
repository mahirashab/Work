boolean mainMenu = true;
boolean gameOnGoing = false;
boolean showingHelp = false;

PImage bg_img;
PImage template;
PImage gameBG;
PImage helpImgs[] = new PImage[2];
PImage android;
PImage tile;
int currentHelpPage = 0;

int interval = 3500;
int current = interval;

int score = 0;
int lives = 10;
boolean alive = true;

Android a;
Tile tiles[] = new Tile[32];
ArrayList<Fruit> fruits = new ArrayList<Fruit>();

void setup() {
  size(800, 500); 
  textSize(18);

  gameBG = loadImage("res/game_background.gif");
  bg_img = loadImage("res/menu_bg.gif");
  template = loadImage("res/template.gif");
  helpImgs[0] = loadImage("res/apple_types.gif");
  helpImgs[1] = loadImage("res/controls.gif");
  android = loadImage("res/android.png");
  tile = loadImage("res/tile.gif");

  a = new Android();
  for (int i = 0; i < 32; i++) {
    tiles[i] = new Tile(i);
  }
}

void draw() {
  if (millis() > current) {
    current += interval;
  }

  if (mainMenu) {
    image(bg_img, 0, 0, width, height);
    showOptions();
  }

  if (gameOnGoing) {
    if (!alive) {
      delay(300);

      gameOnGoing = false;
      mainMenu = true;
      alive = true;
      reset();
    } else {
      image(gameBG, 0, 0, width, height);
      a.show();
      a.wrap();
      a.checkGround(tiles);
      a.checkFruit(fruits);

      textSize(22);
      text("Score: " + score, 100, 90);
      text("Lives: " + lives, 100, 110);

      spawn();

      for (Tile t : tiles) {
        t.show();
      }

      for (int i = fruits.size() - 1; i >= 0; i--) {
        Fruit f = fruits.get(i);
        f.show();
        f.update();
        if (f.checkTile(tiles)) {
          fruits.remove(i);
        }
      }

      if (lives == 0) {
        alive = false;
      }
    }
  }

  if (showingHelp) {
    showHelp();
  }
}

void showHelp() {
  image(helpImgs[currentHelpPage], 0, 0, width, height);

  fill(51);
  rect(30, height - 45, 115, 30);
  fill(255);
  text("Back", 65, height - 25);

  if (currentHelpPage < 1) {
    fill(51);
    rect(width - 150, height - 45, 115, 30);
    fill(255);
    text("Next", width - 113, height - 25);
  }
}

void reset() {
  a = new Android();
  fruits = new ArrayList<Fruit>();
  for (int i = 0; i < tiles.length; i++) {
    tiles[i] = new Tile(i);
  }
  score = 0;
  lives = 10;
}

void spawn() {
  if (millis() > current) {
    current += interval;
    if (0.5 < random(1)) {
      interval -= 20;
    }
    fruits.add(new Fruit());
    println(fruits.size());
  }
}

void showOptions() {
  textSize(20);
  image(template, 270, 150, 250, 50);
  fill(0);
  text("Play Game", 352, 182);

  image(template, 270, 230, 250, 50);
  fill(0);
  text("How To Play", 345, 262);

  image(template, 270, 310, 250, 50);
  fill(0);
  text("Exit Game", 352, 342);
}

void mousePressed() {
  if (mouseX > 270 && mouseX < 520 && mouseY > 150 && mouseY < 200 && mainMenu) {
    reset();

    gameOnGoing = true;
    mainMenu = false;
  }

  if (mouseX > 270 && mouseX < 520 && mouseY > 230 && mouseY < 280 && mainMenu) {
    showingHelp = true;
    mainMenu = false;
  }

  if (showingHelp && currentHelpPage < 1 && mouseX > width - 150 && mouseX < (width - 150) + 115 && mouseY > height - 45 && mouseY < (height - 45) + 30) {
    currentHelpPage++;
  }

  if (showingHelp && mouseX > 30 && mouseX < 30 + 115 && mouseY > height - 45 && mouseY < (height - 45) + 30) {
    if (currentHelpPage == 0) {
      mainMenu = true;
      showingHelp = false;
    } else {
      currentHelpPage--;
    }
  }
}

void keyPressed() {
  if ((key == 'e' || key == ESC) && gameOnGoing) {
    gameOnGoing = false;
    mainMenu = true;
    key = 0;
  }

  if (gameOnGoing && key == 'a') {
    a.left();
  }

  if (gameOnGoing && key == 'd') {
    a.right();
  }
}
