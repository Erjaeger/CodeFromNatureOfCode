//In this sketch you can click on the screen and drag the mouse to launch some ball.
//There are three types of liquid who looks like boxes
//Each box have a different density. There are also some "air friction" and gravity applied everywhere on the screen.


var particles = [];
var liquidHard, liquidMedium, liquidLow;
var isMouseActivated = false;
var lastParticle = null;

function setup(){
  createCanvas(640, 640);

  //Generate the differents liquid. Liquid Background simulate the air friction
  liquidHard = new Liquid(500, 100, 140, 100, 0.05, "rgb(242, 50, 50)");
  liquidMedium = new Liquid(500, 300, 140, 100, 0.025, "rgb(242, 158, 2)");
  liquidLow = new Liquid(500, 500, 140, 100, 0.001, "rgb(37, 170, 32)");
  liquidBackground= new Liquid(0,0,640, 640, 0.001, "rgb(51, 51, 51)");
}

function draw(){
  background(51);

  //Liquids displayed in first so the balls are in front of them
  liquidBackground.display();
  liquidHard.display();
  liquidMedium.display();
  liquidLow.display();

  for(var p in particles){
    if(isMouseActivated && particles[p].isNew){
      particles[p].drawLineBetweenParticleAndMouse();
    }

    //Apply the differents forces to the balls
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
  //Generate a ball is the mouse is clicked
  if(!isMouseActivated){
    var newParticle = new Particle(mouseX, mouseY, random(1,5));
    particles.push(newParticle)
    lastParticle = newParticle;
  }
  isMouseActivated = true; //Use to only have when ball when the user click on the screen

}

function mouseReleased(){
  isMouseActivated = false;

  //When the mouse is released a force in the direction of the mouse is apply to the ball
  var mouseV = createVector(mouseX, mouseY);
  var mousePos = p5.Vector.sub(mouseV, lastParticle.pos);
  lastParticle.applyForce(mousePos)
  lastParticle.isNew = false;
}
