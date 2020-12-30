Mover m;

void setup(){
  size(900,450);
  m = new Mover();
  background(0);
  frameRate(120);
}

void draw(){
  
  m.update();
  m.edges();
  m.display();
  
 
}

void mousePressed(){
  save("m.png");
}
    
class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;

Mover(){
  location = new PVector(width/2,height/2);
  velocity = new PVector(1,3);
  acceleration = new PVector(0,0);
}
  
  void update(){
    PVector mouse;
    mouse = new PVector(mouseX,mouseY);
    mouse.sub(location);
    mouse.setMag(0.5);
    acceleration = mouse;
    
    velocity.add(acceleration);
    velocity.limit(5);
    
    location.add(velocity);
  }
  
  void edges(){
    if (location.x > width) velocity.x = -velocity.x;
    if (location.x < 0) velocity.x = -velocity.x;
    if (location.y > height) velocity.y = -velocity.y;
    if (location.y < 0) velocity.y = -velocity.y;
  }
  
  void display(){
    noStroke();
    fill(255-(location.x/4),255-(location.y/4),255);
    ellipse(location.x,location.y,2,2);
    rotate(location.x/10);
  }
}
