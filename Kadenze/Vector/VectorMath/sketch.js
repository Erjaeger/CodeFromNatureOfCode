var w;

function setup() {
  createCanvas(640, 360);
  w = new Walker();
}

function draw() {
  background(220);
  w.update();
  w.display();
}

function Walker(){
  this.pos = createVector(width/2, 0);
  this.vel = createVector(0, 0);
  this.acc = createVector(0, 0.1);

  this.update = function(){
    this.acc = createVector(random(-0.5,0.5),random(-0.5,0.5));
    this.acc.mult(0.2);
    this.vel.add(this.acc);
    this.pos.add(this.vel);
  }

  this.display = function(){
    fill(255);
    ellipse(this.pos.x, this.pos.y, 16, 16);
  }
}
