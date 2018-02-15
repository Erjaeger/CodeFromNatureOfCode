var particle1;
var liquidHard, liquidMedium, liquidLow;

function setup(){
  createCanvas(640, 640);
  particle1 = new Particle(100, 500, 2);
  liquidHard = new Liquid(500, 100, 140, 100, 3, "rgb(242, 50, 50)");
  liquidMedium = new Liquid(500, 300, 140, 100, 2, "rgb(242, 158, 2)");
  liquidLow = new Liquid(500, 500, 140, 100, 1, "rgb(37, 170, 32)");
}

function draw(){
  background(51);

  if(mouseIsPressed){
    particle1.checkIfMouseOnParticle();
  }

  var gravity1 = createVector(0, 0.2*particle1.mass);
  particle1.applyForce(gravity1);
  particle1.update();
  particle1.edges();
  particle1.display();

  liquidHard.display();
  liquidMedium.display();
  liquidLow.display();
}
