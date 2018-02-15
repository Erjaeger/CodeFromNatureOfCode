function Liquid(x, y, width, height, coef, color){
  this.x = x;
  this.y = y;
  this.width = width;
  this.height = height;

	this.coef = coef;

  this.contains = function(p){
  	var l = p.pos;
    return l.x > this.x && l.x < this.x + this.width &&
      		 l.y > this.y && l.y < this.y + this.height;
  }

  this.calculateDrag=function(p){
    var speed = p.vel.mag();
    var dragMagnitude = this.coef * speed * speed;
    var dragForce = p.vel.copy();
    dragForce.mult(-1);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }

  this.display = function(){
    fill(color);
  	rect(x, y, width, height)
  }
}
