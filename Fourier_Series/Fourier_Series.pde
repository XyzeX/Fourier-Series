float time = 0.0f;
IntList wave = new IntList();

float radius = 200 * (4 / PI);
float newRadius;

void setup() {
  fullScreen();
  stroke(255);
  strokeWeight(4);
  noFill();
}

void draw() {
  background(69);
  translate(500, height / 2);
  
  float x = 0;
  float y = 0;
  float prevx = x;
  float prevy = y;
  int n;
  
  for (int i = 0; i < 10000; i++) {
    prevx = x;
    prevy = y;
    
    n = i * 2 + 1;
    newRadius = radius / n;
    x += cos(time * n) * newRadius;
    y += sin(time * n) * newRadius;
    
    circle(prevx, prevy, newRadius * 2);
    line(prevx, prevy, x, y);
  }
  wave.append(int(y));
  
  if (wave.size() > 720) {
    wave.remove(0);
  }
  
  translate(500, 0);
  
  line(x - 500, y, 0, wave.get(wave.size() - 1));
  
  beginShape();
  for (int i = 0; i < wave.size(); i++) {
    vertex(wave.size() - i, wave.get(i));
  }
  endShape();

  time += PI / 360 * 2;
}
