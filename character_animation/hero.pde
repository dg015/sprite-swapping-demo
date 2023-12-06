class Hero {
  PVector position;
  PVector velocity;
  int speed = 2;

  int xWidth = 64; //width of each frame on the spritesheet
  int yHeight = 64; //height of each frame on the spritesheet

  PImage spritesheet;

  int xOffset;
  int yOffset;
  int fWidth;
  int fHeight;
  int frame = 0;

  Direction direction = Direction.South;

  Hero() {
    position = new PVector(width/2, height/2);
    velocity = new PVector();
    spriteSheet = loadImage("stella_walk.png");
  }

  void move() {
    //why am I making a new vector now ? Because I want to normalize it to keep the diagonal
    //movement at the same speed as orthogonal movement. BUT if I were to normalise the vector
    //velocity this would mess up my += and -= math on the keystrokes (because the values
    //would start to be less than 1 when moving diagonally, so the keystrokes wouldn't cancel
    //each other out.
    PVector movement = velocity.copy();
    movement.setMag(speed); //setMag does .normalize() and then .mult(speed) :-)
    position.add(movement);
    
    if ( frameCount %10 == 0 && (velocity.x !=0 || velocity.y != 0))
    {
      if (velocity.x ==0 && velocity.y ==0)
      {
        frame = 0;
      }
      else
      {
        frame = (frame + 1) % frames ;
      }
    }
  }

  void display() {
    fill(255);
    rect(position.x - xWidth/4, position.y - 0.9 * yHeight, xWidth/2, yHeight);
    copy(spriteSheet, xOffset + xWidth * frame, yOffset + yheight * direction.ordinal(), xWidht, yHeight
    int(position.x - xWidth/2), int(position.y - 0.9 * yHeight), xWidth, yHeight);
  }
  Direction getDiraction()
  {
    if (velocity.x = 0 && velocity.y == 1)
    {
      return Direction.North;
    }
    if (velocity.x = 1 && velocity.y == 1)
    {
      return Direction.NorthEast;
    }
    if (velocity.x = 1 && velocity.y == 0)
    {
      return Direction.East;
    }
    if (velocity.x = 1 && velocity.y == -1)
    {
      return Direction.SouthEat;
    }
    if (velocity.x = 0 && velocity.y == -1)
    {
      return Direction.South;
    }
    if (velocity.x = -1 && velocity.y == 1)
    {
      return Direction.SouthWest;
    }
    if (velocity.x = -1 && velocity.y == 0)
    {
      return Direction.West;
    }
    if (velocity.x = -1 && velocity.y == -1)
    {
      return Direction.NorthWest;
    }
  }
}
