var w;

function setup() {
  createCanvas(400, 400);
  w = new Walker();
}

function draw() {
  background(220);
  w.walk();
  w.display();
}

function Walker(){
  this.x = width/2;
  this.y = height/2;

  this.walk = function(){
    this.x += random(-1, 1);
    this.y += random(-1, 1);
  }

  this.display = function(){
    fill(255);
    ellipse(this.x, this.y, 16, 16);
  }
}
