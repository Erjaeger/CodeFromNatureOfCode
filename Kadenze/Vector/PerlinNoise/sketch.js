var w;
var tx = 1000;
var ty = 10000;

function setup() {
  frameRate(60);
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

  this.update = function(){
    this.acc = createVector(map(noise(tx), 0, 1, -1, 1), map(noise(ty), 0, 1, -1,1));
    tx += 0.1;
    ty += 0.2;
    this.vel.add(this.acc);
    this.pos.add(this.vel);
  }

  this.display = function(){
    fill(255);
    ellipse(this.pos.x, this.pos.y, 16, 16);
  }
}
