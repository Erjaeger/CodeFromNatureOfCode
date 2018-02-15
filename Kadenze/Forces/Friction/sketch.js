var particle1;
var particle2;

function setup(){
  createCanvas(640, 360);
  particle1 = new Particle(1.5, 100, 0);
  particle2 = new Particle(3, 100, 0);
}

function draw(){
  background(51);

  liquid.display();

  if(liquid.contains(particle1)){
    var dragForce = liquid.calculateDrag(particle1);
    particle1.applyForce(dragForce);
  }

  var gravity = createVector(0, 0.1 * particle1.mass);
  particle1.applyForce(gravity);


  particle1.update();
  particle1.edges();
  particle1.display();

  particle2.update();
  particle2.edges();
  particle2.display();
}
