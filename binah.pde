import processing.video.*;

PShader blurShader;
Input sound;
Rain rain;
Paddle paddle;
int lastSound = 0;

void setup() {
    //size(600, 600, P2D);
    fullScreen(P2D);

    sound = new Input(this);
    rain = new Rain(width, height);
    paddle = new Paddle(width, height);

    blurShader = loadShader("blur.glsl", "vertex.glsl");
}

void draw() {
    float inputValue = normaliseInputValue(sound.value());

    if (inputValue > width * 2) {
        rain.createRain(1);
    }

    if (inputValue > 1) {
        lastSound = millis();
    }

    if (inputValue < width/6 && millis() - lastSound > 5000) {
        paddle.shrink();
    }

    handleCollision();

    filter(blurShader);
    rain.update();
    rain.draw();
    paddle.update(inputValue);
    paddle.draw();
}

float normaliseInputValue(float value) {
    value = value * (width/4) * 1000 * 3;

    return value > width/6 ? value : 15;
}

void handleCollision() {
    ArrayList<Raindrop> paddleCollisions = new ArrayList<Raindrop>();

    for (Raindrop raindrop : rain.raindrops) {
        if (raindrop.hasCollidedWithPaddle(paddle)) {
            paddle.handleCollision();
            raindrop.handleCollision();
            paddleCollisions.add(raindrop);
        }
    }

    rain.handleCollision(paddleCollisions);
}
