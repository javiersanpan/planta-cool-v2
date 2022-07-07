#include <ESP8266WiFi.h>
#include <FirebaseESP8266.h>
#include "arduino_secrets.h"

// ID de la planta
String ID = "P001";

// Credenciales de Firebase
#define API_KEY SECRET_API_KEY
FirebaseData firebaseData;

// Constantes de sensor de humedad
const int dry = 600;
const int wet = 336;

// Variables para la bomba de agua
int regar = 0;
int mililitros = 0;

void setup() {
  // Iniciar pin de bomba de agua
  pinMode(D0,OUTPUT);
  digitalWrite(D0, HIGH);

  // Monitor serial
  Serial.begin(19200);
  Serial.println();

  // Conectar a WiFi
  WiFi.begin(SECRET_SSID, SECRET_WIFIPASSWORD);
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(250);
  }
  Serial.print("\nConectado al Wi-Fi");
  Serial.println();

  // Iniciar Firebase
  Firebase.begin(SECRET_FIREBASE_HOST, SECRET_FIREBASE_AUTH);
  Firebase.reconnectWiFi(true);

  // mililitros contador

  Serial.println();
  Serial.print("Mililitros: ");
  Serial.print(mililitros);
  Firebase.getInt(firebaseData, ID + "/mililitros");
  mililitros = firebaseData.intData();
  
}


void loop() {

  Firebase.getInt(firebaseData, ID + "/regar");
  regar = firebaseData.intData();

  // Leer sensor de humedad
  int sensorVal = analogRead(A0);
  Serial.print(sensorVal);
  Serial.println();

  int percentageMoisture = map(sensorVal, wet, dry, 100, 0);

  Serial.print(percentageMoisture);
  Serial.println("%");
  Serial.println();
  
  // Subir datos de la humedad a Firebase
  Firebase.setInt(firebaseData, ID + "/humedad", percentageMoisture);

  //Regar si no está humeda

  if(percentageMoisture < 50){
    regar = 1;
    }

   // Sensor de nivel del agua
  int hayAgua = digitalRead(D1);

  if(hayAgua){
    Serial.println("Sí hay agua");
    Firebase.setInt(firebaseData, ID + "/tanque", true);
    Serial.println();
    } else {
    Serial.println("No hay agua");
    Firebase.setInt(firebaseData, ID + "/tanque", false);
    Serial.println();
      }


// regar
  

  while(regar){
  // Loop de la bomba de agua
  digitalWrite(D0, LOW);
  delay(1000);
  digitalWrite(D0, HIGH);
  regar = 0;
  Firebase.setInt(firebaseData, ID + "/regar", 0);

  // mililitros contador
  if(hayAgua){
  Serial.println();
  Serial.print("Mililitros: ");
  Serial.print(mililitros);
  mililitros = mililitros + 25;
  Firebase.setInt(firebaseData, ID + "/mililitros", mililitros);
  Serial.print(mililitros);
  } else {
  Serial.println();
  Serial.print("Mililitros: ");
  Serial.print(mililitros);
  mililitros = mililitros;
  Firebase.setInt(firebaseData, ID + "/mililitros", mililitros);
  Serial.print(mililitros);
    
    }
  
  }


  

  delay(3000);

}
