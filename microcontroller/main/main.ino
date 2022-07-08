#include <ESP8266WiFi.h>
#include <FirebaseESP8266.h>
#include "arduino_secrets.h"

// Plant ID, change if more than one plant is used in the database
String ID = "P001";

// Firebase credentials
#define API_KEY SECRET_API_KEY
FirebaseData firebaseData;

// Humidity sensor constants
// These values depend on the size of the pot and the position of the sensor, please calibrate them to the correct values when first used
const int dry = 600;
const int wet = 336;

// Water pump inital state
int pumpWater = 0;
// The amount of water is an aproximation based on the size of the container and the time the water pump is activated, this must me calibrated
int milliliters = 0;

// Setup is only run when first initiated
void setup() {
  // Water pump is connected to the D0 pin, set initial state
  pinMode(D0,OUTPUT);
  digitalWrite(D0, HIGH);

  // Serial monitor
  Serial.begin(19200);
  Serial.println();

  // Connect to WiFi Network 
  // SSID and password are set in arduino_secrets header, check documentation for more information
  WiFi.begin(SECRET_SSID, SECRET_WIFIPASSWORD);
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(250);
  }
  Serial.print("\nWiFi connected succesfully");
  Serial.println();

  // Firebase connection
  // Host and authorization are set in arduino_secrets header, check documentation for more information
  Firebase.begin(SECRET_FIREBASE_HOST, SECRET_FIREBASE_AUTH);
  Firebase.reconnectWiFi(true);

  // Start the water volume counter in remote database
  Serial.println();
  Serial.print("Milliliters: ");
  Serial.print(milliliters);
  Firebase.getInt(firebaseData, ID + "/milliliters");
  milliliters = firebaseData.intData();
}

// Loop will run until explicitly told otherwise
void loop() {
  // Read humidity sensor from the A0 pin, the value will be printed
  // (This can be used to calibrate the sensor to dry and wet values)
  int sensorVal = analogRead(A0);
  Serial.print(sensorVal);
  Serial.println();
  // The moisture percentagae will depend on the constants set for wet and dry
  int percentageMoisture = map(sensorVal, wet, dry, 100, 0);
  // Print percentage to serial monitor
  Serial.print(percentageMoisture);
  Serial.println("%");
  Serial.println();
  // Set current moisture percentage in remote database
  Firebase.setInt(firebaseData, ID + "/humidity", percentageMoisture);

  // Empty water tank sensor
  int notEmpty = digitalRead(D1);
  if (notEmpty) {
    // Print water state to serial monitor and set remote database state as true
    Serial.println("There is enough water");
    Serial.println();
    Firebase.setInt(firebaseData, ID + "/tank", true);
  } else {
    // Print water state to serial monitor and set remote database state as false
    Serial.println("No hay agua");
    Serial.println();
    Firebase.setInt(firebaseData, ID + "/tank", false);
  }

  // Check the state of the water pump activation in remote database
  Firebase.getInt(firebaseData, ID + "/pumpWater");
  pumpWater = firebaseData.intData();
  // The water pump will be activated if moisture is under 40%, this can be adjusted to the users preference
  if (percentageMoisture < 40) {
    pumpWater = 1;
  }

  // Initiate water pump
  while (pumpWater) {
    // This will initiate the water pump for 1000ms, this can be adjusted to preference
    digitalWrite(D0, LOW);
    delay(1000);
    digitalWrite(D0, HIGH);
    // Set pumpWater variable to 0 locally and remotely to stop loop
    pumpWater = 0;
    Firebase.setInt(firebaseData, ID + "/pumpWater", 0);

    // Water volume counter
    if (notEmpty) {
      // If the water tank is not empty, the amount of water pumped will be added to the milliliters variable
      // The amount set here is an estimation based on the size of water tank and the time the pump has actionated
      // this must be calibrated if implemented, and it can vary with the energy given to the pump and how filled the water tank is
      milliliters = milliliters + 25;
      // Set new water volume count in remote database
      Firebase.setInt(firebaseData, ID + "/milliliters", milliliters);
      // Print to serial monitor
      Serial.println();
      Serial.print("Milliliters: ");
      Serial.print(milliliters);
    } else {
    // If the tank is empty, the amount of water consumed will not change, and it will be printed to serial monitor
    Serial.println();
    Serial.print("Milliliters: ");
    Serial.print(milliliters);
    }
  }
  // Delay 3000 miliseconds (3s) to not overwhelm database, when implemented, a larger amount of time is recomended (120s-300s).
  delay(3000);
}