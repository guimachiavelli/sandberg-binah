class Rain {
    ArrayList<Raindrop> raindrops;
    int initialRaindrops = 5;

    Rain(float width, float height) {
        raindrops = new ArrayList<Raindrop>();

        for (int i = 0; i < initialRaindrops; i += 1) {
            raindrops.add(new Raindrop(width, height));
        }
    }

    void setup() {

    }

    void update() {
        Raindrop raindrop;

        for (int i = raindrops.size() - 1; i >= 0; i -= 1) {
            raindrop = raindrops.get(i);
            raindrop.update();
            if (raindrop.isOutOfBounds()) {
                raindrops.remove(i);
            }
        }

        if (raindrops.size() == 0) {
            createRain(int(random(5)) + 1);
        }
    }

    void draw() {
        for (Raindrop raindrop : raindrops) {
            raindrop.draw();
        }
    }

    void handleCollision(ArrayList<Raindrop> collisions) {
        for (Raindrop raindrop : collisions) {
            createRain(2);
        }
    }

    void createRain() {
        raindrops.add(new Raindrop(width, height));
    }

    void createRain(int amountOfDrops) {
        while (amountOfDrops > 0) {
            raindrops.add(new Raindrop(width, height));
            amountOfDrops -= 1;
        }
    }
}
