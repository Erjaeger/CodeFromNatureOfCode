var w;

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
  this.acc = p5.Vector.fromAngle(PI/2);
  this.acc.setMag(0.2);

  this.update = function(){
      this.acc.rotate(0.1);

    // var mouse = createVector(mouseX, mouseY);
    // this.acc = p5.Vector.sub(mouse,this.pos);
    // this.acc.normalize();
    this.vel.add(this.acc);
    this.pos.add(this.vel);
  }

  this.display = function(){
    fill(255);
    ellipse(this.pos.x, this.pos.y, 16, 16);
  }
}
