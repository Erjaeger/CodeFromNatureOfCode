function Particle(x, y, m) {
	this.pos = createVector(x, y);
  this.vel = createVector(0,0);
  this.acc = createVector(0,0);

  this.mass = m;

  this.applyForce = function(f){
    var force = p5.Vector.div(f,this.mass);
    this.acc.add(force);
  }

  this.update = function(){
  	this.vel.add(this.acc);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }

  this.display = function(){
  	fill(155);
    ellipse(this.pos.x, this.pos.y, 10*this.mass, 10*this.mass);
  }

  this.checkEdges = function(){
    if (this.pos.y > height){
      this.vel.y *= -1;
      this.pos.y = height;
    }

    if(this.pos.x > width){
      this.vel.x *= -1;
      this.pos.x = width;
    }

    if(this.pos.x < 0){
      this.vel.x *= -1;
      this.pos.x = 0;
    }
  }
}