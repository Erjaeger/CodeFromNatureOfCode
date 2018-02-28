var vehicle;
var flowfield;

function setup() {
  createCanvas(640, 360);
  flowfield = new Flowfield(20);
  flowfield.initField()
}

function draw(){
  background(51);
  flowfield.display();
}
