# ev_app

App that shows ev data through bluetooth

## Current Plan
1. Check for Bluetooth connectivity. If not prompt user to turn on bluetooth
2. Check if the mac address is stored in shared preference.
3. If not scan and add the device to shared preference folder of the app.
4. Decode the characteristic and work on the UI.

## Progress
1. Authentication has been added
2. Bluetooth connection checks have added, as soon as bluetooth is not available the device will stop showing the ev data ui 
3. BluetoothScan have been implemented needs to be tested thoroughly.


