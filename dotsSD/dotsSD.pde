class Dot {
    float x,y;
    float[] color = [];
    float size;
    Dot(){
        //set dot size
        size = floor(random(1, 4));
        //set random rgb color
        color[0] = floor(random(0, 255));
        color[1] = floor(random(0, 255));
        color[2] = floor(random(0, 255));
    }

    void display(){
        strokeWeight(size);
        float alpha = floor(random(50,255));
        stroke(color[0], color[1], color[2], alpha);
        point(x, y);
    }

   void update(){
        // Set a mean for the X-axis 
        float xMean = width / 2;
        // Set a mean for the Y-axis 
        float yMean = height / 2;
        // Set a deviation for both X and Y
        float stdDeviation = 150;  

        float xStepSize = stdDeviation * randomGaussian() + xMean;
        float yStepSize = stdDeviation * randomGaussian() + yMean;

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
    //background(0);
    for (int i = 0; i < dots.length; i = i+1) {
        dots[i].update();
    }
}
// Resize the canvas to the user's screensize
void resize(int w, int h) {
  size(w,h);
  fillDots();
}
