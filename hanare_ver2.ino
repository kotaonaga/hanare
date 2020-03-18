const int ssr_pin = 7;
const int solenoid_pin = 8;

int count = 0;
int now = 0;
int ssr_state = 0;

void setup() {
  Serial.begin(9600);
  pinMode(ssr_pin, OUTPUT);
  pinMode(solenoid_pin, OUTPUT);
}

void loop() {
  if (Serial.available() > 0) {
    ssr_state = Serial.read();
  }

  if (count > 0) {
    count--;
  }

  if (now == 1) {
    if (ssr_state == 0 && count == 0) {
      digitalWrite(ssr_pin, LOW);
      now = 0;
    }
  } else {
    if (ssr_state == 1) {
      digitalWrite(ssr_pin, HIGH);
      now = 1;
      count = 100;
    }
  }

}
