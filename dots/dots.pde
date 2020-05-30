class Dot {
    float x,y;
    float[] color = [];
    float size;

    Dot(){
        // Set a random initial point of origin
        x = floor(random(width));
        y = floor(random(height));
        //set dot size
        size = 1;

        //set random rgb color
        color[0] = floor(random(255));
        color[1] = floor(random(255));
        color[2] = floor(random(255));
    }

    void display(){
        strokeWeight(size);
        float alpha = floor(random(50,255));
        stroke(color[0], color[1], color[2], alpha);
        point(x, y);
    }

   void update(){
        xStepSize = floor(random(-10, 10)) + x;
        yStepSize = floor(random(-10, 10)) + y;        
            
        boolean outOfBoundaryX =  xStepSize > width || xStepSize < 0;
        boolean outOfBoundaryY = yStepSize > height || yStepSize < 0;

        // We don't want the dots to spawn out of the window
        // Reset the Dot initial position to a random point inside the canvas
        // call update() again and try a new location
        if(outOfBoundaryX || outOfBoundaryY){
            x = floor(random(width));
            y = floor(random(height));
            update();
            return;
        }

        x = xStepSize;
        y = yStepSize;
        display();
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
