import processing.sound.*;

class Input {
    FFT fft;
    AudioIn in;
    float threshold = 100;
    int bands = 512;
    float[] spectrum = new float[bands];
    PApplet parent;

    Input(PApplet theParent) {
        parent = theParent;

        in = new AudioIn(parent, 0);
        in.start();

        fft = new FFT(parent, bands);
        fft.input(in);
    }

    float value() {
        fft.analyze(spectrum);

        return spectrum[int(bands/2)];
    }
}
