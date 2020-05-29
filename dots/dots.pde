class Dot {
    float x,y;
    float[] color = [];
    float size;

    Dot(){
        // Set a random point of origin
        x = random(0, width);
        y = random(0, height);
        //set dot size
        size = 1;

        //set random rgb color
        color[0] = random(255);
        color[1] = random(255);
        color[2] = random(255);
    }

    void display(){
        strokeWeight(size);
        float alpha = random(50,255);
        stroke(color[0], color[1], color[2], alpha);
        point(x, y);
    }

   void update(){
        xStepSize = random(-10, 10) + x;
        yStepSize = random(-10, 10) + y;        
            
        boolean outOfBoundaryX =  xStepSize > width || xStepSize < 0;
        boolean outOfBoundaryY = yStepSize > height || yStepSize < 0;

        // We don't want the dots to spawn out of the window
        // call update() again and try a new location
        if(outOfBoundaryX || outOfBoundaryY){
            update();
        } else {
            x = xStepSize;
            y = yStepSize;
            display();
        }
    }
}

Dots[] dots = [];

// Creates an array with dots
void fillDots()
{
    dots = [];
    for (int i = 0; i < 100; i = i+1) {
        dots[i] = new Dot();
    }

}

void setup()
{
    background(0);
    smooth();
    frameRate(30);
}

void draw(){  
    for (int i = 0; i < dots.length; i = i+1) {
        dots[i].update();
    }
}
// Resize the canvas to the user's screensize
void resize(int w, int h) {
  size(w,h);
  fillDots();
}
