var circles = [];
const SIZE_CIRCLE = 60;
const SPACE_BETWEEN = 10
const NUMBER_LINE = 6;
const NUMBER_COLUMN = 6;
const colors = [
  {
      backgroundColor:"#338275",
      circlesColors:["#1B515E", "#88B990", "#ABCD9E"]
  },
  {
      backgroundColor:"#456672",
      circlesColors:["#314357", "#E3B587", "#C98C70"]
  },
  {
      backgroundColor:"#584F84",
      circlesColors:["#38486F", "#876A96", "#D7C1E0"]
  },

]
var backgroundColor = "#C4C4C4"

function setup() {
  createCanvas(1920, 1080);
  var allWidth = (width - (NUMBER_COLUMN * SIZE_CIRCLE)) / 2;
  var allHeight = (height - ((NUMBER_LINE * SIZE_CIRCLE) + (NUMBER_LINE * SPACE_BETWEEN)-SPACE_BETWEEN)) /2;

  var offset = SIZE_CIRCLE/2;
  var randomColor = colors[Math.floor(random(0, colors.length))];

  backgroundColor = randomColor.backgroundColor;
  for(var i = 0; i < NUMBER_LINE; i++){
    for(var j = 0; j < NUMBER_COLUMN; j++){
      var spaceB = j < NUMBER_LINE ? SPACE_BETWEEN*i : 0;
      var randomColorCircle = randomColor.circlesColors[Math.floor(random(0, randomColor.circlesColors.length))]
      if(j%2 == 0){
        var temp = new Vehicle(allWidth + SIZE_CIRCLE/2 + j*SIZE_CIRCLE, allHeight +i*SIZE_CIRCLE + (SIZE_CIRCLE/2)+offset/2+spaceB, randomColorCircle)
      } else {
        var temp = new Vehicle(allWidth + SIZE_CIRCLE/2 + j*SIZE_CIRCLE, allHeight +i*SIZE_CIRCLE + (SIZE_CIRCLE/2)-(offset/2)+spaceB, randomColorCircle)
      }
      circles.push(temp)
    }
  }
}

function draw(){
  background(backgroundColor);
  circles.forEach((c)=>{
    c.display();
  })
}

function Vehicle(x, y, color){
  this.pos = createVector(x, y);
  this.color = color;

  this.display = function(){
    fill(this.color);
    noStroke();
    ellipse(this.pos.x, this.pos.y, SIZE_CIRCLE, SIZE_CIRCLE);
  }
}
