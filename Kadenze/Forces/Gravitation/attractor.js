function Attractor(x, y){
  this.pos = createVector(x, y);
  this.mass = 20;
  this.G = 1;

  this.update = function(){
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }

  this.display = function(){
    fill(255);
    ellipse(this.pos.x, this.pos.y, this.mass*10, this.mass*10);
  }

  this.calculateAttraction = function(p){
    var force = p5.Vector.sub(this.pos, p.pos);
    var distance = force.mag();
    distance = constrain(distance, 5, 25);
    force.normalize();
    var strength = (this.G * this.mass * p.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
}
