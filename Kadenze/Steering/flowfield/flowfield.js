
function Flowfield(sizeCell){
  this.nbrX = Math.floor(width/sizeCell);
  this.nbrY = Math.floor(height/sizeCell);
  this.sizeCell = sizeCell;
  this.field = [];

  this.initField = function(){
    noiseSeed(Math.floor(random(10000)));
    var xoff = 0;
    for(var i = 0; i < this.nbrX ; i++){
      this.field.push([])
      var yoff = 0;
      for(var j = 0; j < this.nbrY; j++){
        // colorTemp = "rgb("+Math.floor(random(0, 255)) + "," + Math.floor(random(0, 255)) + "," + Math.floor(random(0, 255)) + ")"
        this.field[i].push([]);
        var theta = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
        this.field[i][j] = createVector(cos(theta), sin(theta))
        xoff += 0.01
      }
      yoff += 0.01
    }
  }

  this.display = function(){
    for(var x = 0; x < this.nbrX ; x++){
      for(var y = 0; y < this.nbrY; y++){
        // fill(this.field[i][j])
        this.drawVector(this.field[x][y], x*sizeCell, y*sizeCell, sizeCell)
      }
    }
  }

this.drawVector = function(v, x, y, scayl) {
    push();
    var arrowsize = 4;
    // Translate to location to render vector
    translate(x, y);
    stroke(200, 100);
    // Call vector heading function to get direction (note that pointing to the right is a heading of 0) and rotate
    rotate(v.heading());
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    var len = v.mag() * scayl;
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    line(0, 0, len, 0);
    line(len,0,len-arrowsize,+arrowsize/2);
    line(len,0,len-arrowsize,-arrowsize/2);
    pop();
  };
}
