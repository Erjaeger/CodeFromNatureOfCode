var particle;

function setup() {
  createCanvas(400, 400);
  particle = new Particle(width/2, 0, 5);
}

function draw() {
  background(220);

  rect(0, height/2, width, height);


  var gravity = createVector(0, 0.1*particle.mass);
  particle.applyForce(gravity);

  particle.update();
  particle.checkEdges();
  particle.display();
}
