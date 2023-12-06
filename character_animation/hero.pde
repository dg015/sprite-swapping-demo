class Hero {
  PVector position;
  PVector velocity;
  int speed = 2;

  int xWidth = 64; //width of each frame on the spritesheet
  int yHeight = 64; //height of each frame on the spritesheet

  Hero() {
    position = new PVector(width/2, height/2);
    velocity = new PVector();
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
    
  }

  void display() {
    fill(255);
    rect(position.x - xWidth/4, position.y - 0.9 * yHeight, xWidth/2, yHeight);
  }

}
