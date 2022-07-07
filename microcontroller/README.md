<h1> Microcontroller code </h1>

This code is made for the ESP8266 microcontroller. It has been tested, compiled and implemented using the Arduino IDE which you can download <a href="https://www.arduino.cc/en/software">here</a>.

<h2> Sensitive data </h2>

This code uses sensitive data, such as the WiFi credentials and Firebase API login. Arduino manages sensitive data in headers called secrets. 

This repository includes a template for the information required, when used, remove TEMPLATE_ from the file name, and fill in the required data.

<h2> ESP8266 in Arduino IDE </h2>

In order to use the ESP8266 microcontroller in the arduino IDE, you will need to downlooad its Arduino core, you can find instructions to do so <a href="https://github.com/esp8266/arduino">in the following repository</a>.

The version of the ESP8266 platform used is 3.0.2. The board selected is NodeMCU 0.9 (ESP-12 Module).

<h2> Firebase integration </h2>

In order to connect to Firebase realtime databse, Firebase ESP8266 Client 4.0.0 by Mobitz has been used. You can download the library from Arduino IDE Library Manager, and find more about it <a href="https://github.com/mobizt/Firebase-ESP8266"> here </a>.