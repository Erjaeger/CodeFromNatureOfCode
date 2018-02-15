var particle;
var attractor;

function setup(){
  createCanvas(640, 360);
  particle = new Particle(200, 100, 1);
  attractor = new Attractor(width/2, height/2);
}

function draw(){
  background(51);

  var force = attractor.calculateAttraction(particle);
  particle.applyForce(force);

  particle.update();
  particle.display();

  attractor.display();
}
