class Paddle {
    float x;
    float y;
    float width;
    float height;
    float canvasWidth;
    float canvasHeight;
    float increment = 2.5;
    float initialHeight = 10;
    boolean completed = false;
    int lastCompleted = 0;

    Paddle(float theCanvasWidth, float theCanvasHeight) {
        width = 10;
        height = initialHeight;
        canvasWidth = theCanvasWidth;
        canvasHeight = theCanvasHeight;

        x = (canvasWidth/2) - width/2;
        y = canvasHeight - height;
    }

    void update(float value) {
        if (completed == true && (millis() - lastCompleted > 15000)) {
            completed = false;
            lastCompleted = 0;
            height = initialHeight;
            y = canvasHeight - height;
        }

        if (completed == false && (height > canvasHeight - canvasHeight/10)) {
            println("completed");
            completed = true;
            lastCompleted = millis();
        }

        if (completed == true) {
            width = canvasWidth/10;
            x = (canvasWidth/2) - width/2;
            return;
        }

        width = value;
        x = (canvasWidth/2) - width/2;
    }

    void draw() {
        noStroke();
        pushMatrix();
        fill(255, random(255), random(255));
        rotate(PI/x);
        rect(x, y, width, height);
        popMatrix();
    }

    void handleCollision() {
        grow();
    }

    void grow() {
        height += increment;
        y -= increment;
    }

    void shrink() {
        if (height < initialHeight || completed) {
            return;
        }

        height -= increment;
        y += increment;
    }
}
