const int  bluebuttonPin = 2;
const int  redbuttonPin = 3;
int bluebuttonPushCounter = 0;
int bluebuttonState = 0;
int bluelastButtonState = 0;
int redbuttonPushCounter = 0;
int redbuttonState = 0;
int redlastButtonState = 0;

void setup() {
  // put your setup code here, to run once:
pinMode(bluebuttonPin, INPUT);
pinMode(redbuttonPin, INPUT);
Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:

bluebuttonState = digitalRead(bluebuttonPin);
  if (bluebuttonState != bluelastButtonState) {
    if (bluebuttonState == HIGH) {
      bluebuttonPushCounter++;
      Serial.write("1");
    }
    delay(60);
  }
  bluelastButtonState = bluebuttonState;

  redbuttonState = digitalRead(redbuttonPin);
  if (redbuttonState != redlastButtonState) {
    if (redbuttonState == HIGH) {
      redbuttonPushCounter++;
      Serial.write("2");
    }
    delay(60);
  }
  redlastButtonState = redbuttonState;
}
