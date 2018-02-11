//This code reproduce the comportement of an attacker (the wolf) and some other species (the sheep).
//The comportement could be improve, the escape of the sheep more realistic for example.
//If the random is good, the wolf run from the sheep to an another, it works pretty well.


var w;
var s;
var sheeps = new Array();

var imgWolf, imgSheep;


var selectedSheep = null
var previousSheep = null;

const BORDER_LIMIT = 50;

function setup() {
  createCanvas(400, 400);
  w = new Wolf();

  //Generation of the sheeps
  for(var i=0; i<10; i++){
    sheeps.push(new Sheep(i*10));
  }
}

function draw() {
  background(220);
  var closestSheep = createVector(0, height);

  //for each sheep, i calculate the distance between the wolf and the sheep. I keep the closest sheep to move the wolf to the sheep.
  for(var i=0; i<sheeps.length; i++){
    sheeps[i].update();
    sheeps[i].display();
    var distanceVector = w.calculateDistanceFrom(sheeps[i].pos);
    if(distanceVector.mag() < closestSheep.mag()){
      closestSheep = distanceVector;
      previousSheep = selectedSheep;
      selectedSheep = i;
    }
  }

  //the previous sheep is safe from the wolf
  if(!!previousSheep){
    sheeps[previousSheep].escapedFromTheWolf();
  }

  //the sheep is designed as target for the wolf
  if(selectedSheep !== null && !!sheeps[selectedSheep] && !sheeps[selectedSheep].isChased){
    sheeps[selectedSheep].runAwayFromWolf(closestSheep);
  }
  w.runAfterSheep(closestSheep);
  w.update();
  w.display();
}

function Wolf(){
  this.pos = createVector(width/2, height/2);
  this.vel = createVector(0, 0);
  this.acc = createVector(0, 0);
  this.closestSheep = height;
  this.isInAttackMode = false;

  this.update = function(){
    this.vel.add(this.acc);
    this.pos.add(this.vel);

    //if the wolf is in attack mode, it follows the sheep and it's acceleration is not modified.
    if(!this.isInAttackMode){

      //Some test to avoid to be blocked on a wall
      //Check limit for x
      if(this.pos.x > width - BORDER_LIMIT){
        fill(14,14,14)

        //At the beginning, i used perlin noise instead of random. But each time my sheep and my wolf finished against a wall.
        //Perlin noise was good if i used it to change position but not the acceleration.
        this.acc = createVector(random(-0.5, -0.1), this.acc.y)
      } else if(this.pos.x < BORDER_LIMIT){
        this.acc = createVector(random(0.1, 0.5), this.acc.y)
      } else {
        this.acc = createVector(0, this.acc.y);
      }

      //Check limit for y
      if(this.pos.y > height-BORDER_LIMIT){
        this.acc = createVector(this.acc.x, random(-0.5, -0.1))
      } else if(this.pos.y < BORDER_LIMIT){
        this.acc = createVector(this.acc.x, random(0.5, 0.1))
      } else {
        this.acc = createVector(this.acc.x, 0);
      }
    }

    this.pos.x = constrain(this.pos.x, 0, width);
    this.pos.y = constrain(this.pos.y, 0, height);
  }

  //calculate the distance between the selected sheep and the wolf
  this.calculateDistanceFrom = function(otherPosition){
    var distanceVectorBetween = p5.Vector.sub(otherPosition, this.pos);
    return distanceVectorBetween;
  }

  //Set the sheep's vector as the acceleration's wolf
  this.runAfterSheep = function(closestSheepVector){
    this.acc = closestSheepVector.normalize();
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    this.isInAttackMode = true;
    this.acc.mult(0);
  }

  this.display = function(){
    fill(211, 29, 29)
    text('Wolf!', this.pos.x, this.pos.y);
  }
}

function Sheep(index){
  this.pos = createVector(random(width), random(height));
  this.vel = createVector(0, 0);
  this.acc = createVector(random(-0.1,0.1), random(-0.1, 0.1));

  this.isChased = false;

  this.update = function(){
    this.vel.add(this.acc);
    this.pos.add(this.vel);

    //Same test as the wolf, to avoid to be blocked against a wall
    //Check limit for x
    if(this.pos.x > width - BORDER_LIMIT){
      fill(14,14,14)
      this.acc = createVector(random(-0.5, -0.1), this.acc.y)
    } else if(this.pos.x < BORDER_LIMIT){
      this.acc = createVector(random(0.1, 0.5), this.acc.y)
    } else {
      this.acc = createVector(0, this.acc.y);
    }

    //Check limit for y
    if(this.pos.y > height-BORDER_LIMIT){
      this.acc = createVector(this.acc.x, random(-0.5, -0.1))
    } else if(this.pos.y < BORDER_LIMIT){
      this.acc = createVector(this.acc.x, random(0.5, 0.1))
    } else {
      this.acc = createVector(this.acc.x, 0);
    }


    this.pos.x = constrain(this.pos.x, 0, width);
    this.pos.y = constrain(this.pos.y, 0, height);
  }

  //The sheep goes in the same direction as the wolf
  this.runAwayFromWolf = function(wolfVector){
    this.isChased = true
    this.acc = wolfVector.normalize();
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }

  this.escapedFromTheWolf = function(){
    this.isChased = false;
  }

  this.display = function(){
    fill(33, 72, 135);
    text('sheep!',this.pos.x, this.pos.y);
  }
}
