class Raindrop {
    float x;
    float x2;
    float y;
    float y2;
    float height;
    float[] canvasBounds = new float[2];
    int direction = 1;
    float speed = 5;
    int collisionTolerance = 0;
    boolean hasCollidedBefore = false;

    Raindrop(float canvasWidth, float canvasHeight) {
        height = int(random(50)) + 1;
        x = random(canvasWidth);
        x2 = x;
        y = 0;

        y2 = y + height;

        canvasBounds[0] = canvasWidth;
        canvasBounds[1] = canvasHeight;

        speed = random(speed) + 0.1;

    }

    Raindrop(float canvasWidth, float canvasHeight, float theX, float theY) {
        height = int(random(50)) + 1;
        x = theX + 1;
        y = theY;

        x2 = x;
        y2 = y + height;

        canvasBounds[0] = canvasWidth;
        canvasBounds[1] = canvasHeight;

        speed = random(speed) + 0.1;
        direction = -1;
    }

    void update() {
        float move = speed * direction;

        if (x != x2) {
            move = max(speed/2, 1);
            x += move;
            x2 = x - 10;
        }

        y += move;
        y2 = y + height;
    }

    void draw() {
        stroke(random(255), random(155), random(255));
        line(x, y, x2, y2);
    }

    boolean hasCollidedWithCanvas() {
        return y + height > canvasBounds[1] ||
               x < 0 ||
               x > canvasBounds[0];
    }

    boolean isOutOfBounds() {
        return y + height > canvasBounds[1] ||
               x < 0 ||
               y < 0 ||
               x > canvasBounds[0];
    }

    boolean hasCollidedWithPaddle(Paddle paddle) {
        if (hasCollidedBefore) {
            return false;
        }

        if (x <= paddle.x || x >= paddle.x + paddle.width) {
            return false;
        }

        if (y2 + height >= paddle.y - collisionTolerance &&
            y2 <= paddle.y + collisionTolerance) {
            hasCollidedBefore = true;
            return true;
        }

        return false;
    }

    void handleCollision() {
        direction *= -1;
    }
}
