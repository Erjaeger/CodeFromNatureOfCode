var particles = [];
var liquidHard, liquidMedium, liquidLow;
var isMouseActivated = false;
var lastParticle = null;

function setup(){
  createCanvas(640, 640);
  particle1 = new Particle(100, 500, 2);
  liquidHard = new Liquid(500, 100, 140, 100, 0.05, "rgb(242, 50, 50)");
  liquidMedium = new Liquid(500, 300, 140, 100, 0.025, "rgb(242, 158, 2)");
  liquidLow = new Liquid(500, 500, 140, 100, 0.001, "rgb(37, 170, 32)");
  liquidBackground= new Liquid(0,0,640, 640, 0.001, "rgb(51, 51, 51)");
}

function draw(){
  background(51);
  liquidBackground.display();
  liquidHard.display();
  liquidMedium.display();
  liquidLow.display();

  for(var p in particles){
    if(isMouseActivated && particles[p].isNew){
      particles[p].drawLineBetweenParticleAndMouse();
    }

    var gravity1 = createVector(0, 0.2*particles[p].mass);
    if(!particles[p].isNew){
      particles[p].applyForce(gravity1);
      var airForce = liquidBackground.calculateDrag(particles[p]);
      particles[p].applyForce(airForce);

      if(liquidHard.contains(particles[p])){
        var forceHard = liquidHard.calculateDrag(particles[p]);
        particles[p].applyForce(forceHard)
      }

      if(liquidMedium.contains(particles[p])){
        var forceMedium = liquidMedium.calculateDrag(particles[p]);
        particles[p].applyForce(forceMedium)
      }

      if(liquidLow.contains(particles[p])){
        var forceLow = liquidLow.calculateDrag(particles[p]);
        particles[p].applyForce(forceLow)
      }

      particles[p].update();
      particles[p].edges();
    }
    particles[p].display();
  }
}

function mousePressed(){
  if(!isMouseActivated){
    var newParticle = new Particle(mouseX, mouseY, random(1,5));
    particles.push(newParticle)
    lastParticle = newParticle;
  }
  isMouseActivated = true;

}

function mouseReleased(){
  isMouseActivated = false;

  var mouseV = createVector(mouseX, mouseY);
  var mousePos = p5.Vector.sub(mouseV, lastParticle.pos);
  console.log(mousePos)
  lastParticle.applyForce(mousePos)
  lastParticle.isNew = false;
}
