import processing.sound.*;
import processing.serial.*;

Serial port;

AudioIn in;
Amplitude amp;

int mae = 0;

void setup() {
  port = new Serial(this, Serial.list()[1], 9600);
  size(600, 600);
  strokeWeight(2);
  fill(255, 200, 100);

  in = new AudioIn(this);
  in.start();

  //  // 音量の取得を開始
  amp = new Amplitude(this);
  amp.input(in);
}

void draw() {
  background(255);
  float a = amp.analyze() * 10000;

  float sz = a * 100;
  ellipse(width / 2, height / 2, sz, sz);

  int ima;
  if (a > 2.0) {
    ima = 1;
  } else {
    ima = 0;
  }

  if (mae != ima) {
    port.write(ima);
    mae = ima;
  }
  println(a);
}
