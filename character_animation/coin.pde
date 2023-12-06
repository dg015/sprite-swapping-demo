class Coin {
  PVector position;
  float r = 10;
  int frame = 0;


  Coin() {
    position = new PVector(random(width-50), random(height-50));
  }

  void display() {
    //fill(250, 255, 5);
    //circle(position.x, position.y, 2*r);
    imageMode(CENTER);
    image(spinner[frame], position.x,position.y);
    if (frameCount % 10 ==0)
    {
      frame = (frame + 1) % spinner.length;
    }
}

  boolean collision(float x, float y, float w, float h) {
    //remember that we're drawing her at
    //rect(x - w/4, y - 0.9 * h, w/2, h);
    //debug: show the hitbox diagonal:
    //line((x - w/4), (y - 0.9 * h), (x + w/4), (y - 0.9 * h) + h);
    if ((x - w/4) < position.x - r && (x + w/4) > position.x + r
      && (y - 0.9 * h) < position.y - r && (y - 0.9 * h) + h > position.y + r) {
      return true;
    } else return false;
  }
}
