# ev_app

App that shows ev data through bluetooth

## Current Plan
1. Check for Bluetooth connectivity. If not prompt user to turn on bluetooth
2. Check if the mac address is stored in shared preference.
3. If not scan and add the device to shared preference folder of the app.
4. Decode the characteristic and work on the UI.

## Progress
1. Authentication has been added
2. Bluetooth Scanning Feature has been added.
3. BluetoothScan have been implemented needs to be tested thoroughly.

## What's Remaining
1. Reciving vehical data through bluetooth and observing the recieved characteristics.
3. Decoding the recieved characteristic and saving them in app state.
4. Creating the UI and updating it according to app state.
5. Sending data to cloud by using the end points provided by the company.


