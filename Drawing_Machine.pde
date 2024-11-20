//ideas
/* have a random thing (some type of character) move around
the screen and do something to the users drawing 
- if a certain button is pressed then the character disapears and the drawing is done 
- make r g b buttons add color 
- change thickness
- maybe if mouse is pressed drawing is stopped 
*/

/* things to do
1. get the keycode to work and alter thickness and color
1.5 make a text key to shope which buttons get what (press k to get it)
2. make the little character 

//why are the shapes so big
//make it when mouse is clicked?ss

*/

//different erasing shapes, keep small 

// psuedocode

ChildApplet child; // new screen (key)

float r= 0; //controls red
float g=0; // controls green
float b=0; //controls blue

float shape=0; //controls shapes
float thickness=5; //controls thickness


float x= 800;
float y=800;

float eraserX= random(x);
float eraserY= random(y);


int random_shape;
int random_size;
int random_speed=1;
int random_direction;
int random_duration;

float stop=1; // controls stop and start (1 means go)


PShape star; // creation of the custom shape


void setup(){
  size(800,800);
  windowTitle("Drawing Machine");
  background(255);
  
  // Creating Unique Shape (bowtie)
  star= createShape();
  star.beginShape();
  star.fill(255);
  star.vertex(10,0);
  star.vertex(10,10);
  star.vertex(5,5);
  star.vertex(15,5);
  star.endShape(CLOSE);
  
  rectMode(CENTER);
  child= new ChildApplet();
}

void draw(){
  if (stop==1){
    eraserX= random(x);
    eraserY= random(y);
    random_shape=int(random(4));
    random_size= int(random(5,30));
    random_duration= int(random(500, 30000));
    random_direction= int(random(3));
    fill(255);
    noStroke();
    if (random_shape==0){
      for (int i=0; i<random_duration; i=i+1){
        rect(eraserX,eraserY,random_size,random_size);
        if (random_direction==0){ // ERASES IN A HORIZONTAL LINE
           if (eraserX<= 800 && eraserX>=0){
              eraserX=eraserX+random_speed;
           }
           if (eraserX>800 || eraserX<0){
            random_speed=random_speed*(-1);
            eraserX=eraserX+random_speed;
            }   
         }
         if (random_direction==1){ //ERASES IN A VERTICAL LINE
           if (eraserY<= 800 && eraserY>=0){
              eraserY=eraserY+random_speed;
           }
           if (eraserY>800 || eraserY<0){
            random_speed=random_speed*(-1);
            eraserY=eraserY+random_speed;
            }   
         }
         if (random_direction==2){ // ERASES DIAGONALLY
           if (eraserX<= 800 && eraserX>=0 && eraserY<= 800 && eraserY>=0){
              eraserX=eraserX+random_speed;
              eraserY=eraserY+random_speed;
           }
           if (eraserX>800 || eraserX<0){
            random_speed=random_speed*(-1);
            eraserX=eraserX+random_speed;
            eraserY=eraserY+random_speed;
            }   
         }
       }
  
    }
    if (random_shape==1){
      for (int i=0; i<random_duration; i=i+1){
        ellipse(eraserX,eraserY,random_size,random_size);
        if (random_direction==0){ // ERASES IN A HORIZONTAL LINE
           if (eraserX<= 800 && eraserX>=0){
              eraserX=eraserX+random_speed;
           }
           if (eraserX>800 || eraserX<0){
            random_speed=random_speed*(-1);
            eraserX=eraserX+random_speed;
            }   
         }
         if (random_direction==1){ //ERASES IN A VERTICAL LINE
           if (eraserY<= 800 && eraserY>=0){
              eraserY=eraserY+random_speed;
           }
           if (eraserY>800 || eraserY<0){
            random_speed=random_speed*(-1);
            eraserY=eraserY+random_speed;
            }   
         }
         if (random_direction==2){ // ERASES DIAGONALLY
           if (eraserX<= 800 && eraserX>=0 && eraserY<= 800 && eraserY>=0){
              eraserX=eraserX+random_speed;
              eraserY=eraserY+random_speed;
           }
           if (eraserX>800 || eraserX<0){
            random_speed=random_speed*(-1);
            eraserX=eraserX+random_speed;
            eraserY=eraserY+random_speed;
            }   
         }
       }
   
    }
    if (random_shape==2){ // ERASES AS A LINE
      for (int i=0; i<random_duration; i=i+1){
        line(eraserX,eraserY,random_size,random_size);
         if (random_direction==0){ // ERASES IN A HORIZONTAL LINE
           if (eraserX<= 800 && eraserX>=0){
              eraserX=eraserX+random_speed;
           }
           if (eraserX>800 || eraserX<0){
            random_speed=random_speed*(-1);
            eraserX=eraserX+random_speed;
            }   
         }
         if (random_direction==1){ //ERASES IN A VERTICAL LINE
           if (eraserY<= 800 && eraserY>=0){
              eraserY=eraserY+random_speed;
           }
           if (eraserY>800 || eraserY<0){
            random_speed=random_speed*(-1);
            eraserY=eraserY+random_speed;
            }   
         }
         if (random_direction==2){ // ERASES DIAGONALLY
           if (eraserX<= 800 && eraserX>=0 && eraserY<= 800 && eraserY>=0){
              eraserX=eraserX+random_speed;
              eraserY=eraserY+random_speed;
           }
           if (eraserX>800 || eraserX<0){
            random_speed=random_speed*(-1);
            eraserX=eraserX+random_speed;
            eraserY=eraserY+random_speed;
            }   
         }
           
       }
         
   
    }
  
  }
 
}

void mouseDragged(){
  if (stop==1){
    strokeWeight(thickness);
    fill(r,g,b);
    stroke(0);
    if (shape== 0){
      stroke(r,g,b);
       line(mouseX, mouseY, pmouseX, pmouseY);
    }
    if (shape== 1){
       ellipse(mouseX, mouseY, pmouseX, pmouseY);
    }
    if (shape== 2){
       rect(mouseX, mouseY, pmouseX, pmouseY);
    }
    if (shape== 3){
       shape(star, mouseX, mouseY, pmouseX, pmouseY);
    }
  }
}

void keyPressed() {  
  if (key== 'D' || key== 'd'){ // PAUSE AND RESUME 
    stop=stop*(-1);
  }
  if (key== 'N' || key=='n'){ //START OVER
    background(255);
  }
  
  // CHANGE RED
  if (key == 'R' || key == 'r') {
    if (r<=255){
      r=r+5;
    }
    else{
      r=0;
    }
  } 
  // CHANGE GREEN
   if (key == 'G' || key == 'g') {
    if (g<=255){
      g=g+5;
    }
    else{
      g=0;
    }
  }
  // CHANGE BLUE
  if (key == 'B' || key == 'b'){
    if (b<=255){
      b=b+5;
    }
    else{
      b=0;
    }
  }
  // LINE
  if (key == 'L' || key == 'l') {
    shape=0;
  } 
  // CIRCLE
  if (key == 'C' || key == 'c') {
    shape=1;
  } 
  // RECTANGLE
  if (key == 'S' || key == 's') {
    shape=2;
  } 
  // CUSTOM SHAPE
  if (key == 'O' || key == 'o') {
    shape=3;
  } 
  //THICKNESS
  if (key== CODED){
    if (keyCode == UP){
      if (thickness<=18){
        thickness= thickness+1;
      }
    }
    else if(keyCode == DOWN){
      if (thickness >=1){
        thickness= thickness-1;
      } 
    }
  
  }
}


















class ChildApplet extends PApplet{
  public ChildApplet(){
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }
  
  public void settings(){
    size(400,500, P3D);
    smooth();
  }
  
  public void setup(){
    windowTitle("Key");
  }
  public void draw(){
    background(0);
    strokeWeight(1);
    stroke(0);
    textSize(35);
    text("Key: ", 20,35);
    
    textSize(22);
    text("Changing the Drawing Color: ", 20,70);
    textSize(18);
    text("  r: add red", 20, 95);
    text("  g: add green", 20, 115);
    text("  b: add blue", 20, 135);
    text(" ",20, 155);
    
    textSize(22);
    text("Changing the Drawing Shape: ", 20,180);
    textSize(18);
    text("  l: draw with lines", 20, 205);
    text("  c: draw with circles", 20, 225);
    text("  s: draw with squares", 20, 245);
    text("  o: draw with bowtie", 20, 265);
    text(" ",20,285);
    
    textSize(22);
    text("Changing the Drawing Thickness: ", 20, 310);
    textSize(18);
    text("  UP: increase ", 20, 335);
    text("  DOWN: decrease ", 20, 355);
    
    textSize(22);
    text("Controls: ", 20,400);
    textSize(18);
    text("  d: pause and resume", 20, 425);
    text("  n: new screen/restart", 20, 445);
  }
}
