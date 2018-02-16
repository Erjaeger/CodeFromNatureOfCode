let colors = ["#2BCDC1","#38817A","#393E46","#F66095"]

function Particle(x, y, m){
  this.pos = createVector(x, y);
  this.vel = createVector(0, 0);
  this.acc = createVector(0, 0);
  this.mass = m;
  this.isNew = true; //If isNew there no force apply on the ball
  this.color = colors[Math.floor(random(0,4))]

  this.applyForce = function(force){
    var f = force.copy();
    f.div(this.mass);
    f.x = constrain(f.x, -100, 100) //Constrain used to limit so weird effect
    f.y = constrain(f.y, -100, 100)
    this.acc.add(f);
  }

  this.update = function(){
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }

  this.display = function(){
    fill(this.color)
    ellipse(this.pos.x, this.pos.y, this.mass*20, this.mass*20);
  }

  this.drawLineBetweenParticleAndMouse = function(){
    var mouseV = createVector(mouseX, mouseY);
    var mousePos = p5.Vector.sub(mouseV, this.pos);
    push();
    translate(this.pos.x, this.pos.y);
    line(0, 0, mousePos.x, mousePos.y);
    pop();
  }

  this.edges = function(){ //check if the ball hit the border
    if(this.pos.y > height-(this.mass*20)/2){
      this.vel.y *= -1;
      this.pos.y = height-(this.mass*20)/2;
    }

    if(this.pos.x > width-(this.mass*20)/2){
      this.vel.x *= -1;
      this.pos.x = width-(this.mass*20)/2;
    }

    if(this.pos.x < (this.mass*20)/2){
      this.vel.x *= -1;
      this.pos.x = (this.mass*20)/2;
    }
  }
}
