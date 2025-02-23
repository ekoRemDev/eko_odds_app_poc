# eko_assignment

A new Flutter project to POC of App and code Structure.

## Odds App

This is a simple Flutter app that displays a list of odds and allows the user follow real time changes.

## Main Features

- Display a list of odds
- Allow the user to follow real time changes
- When the app is in the background, to avoid draining the battery and to reduce overloading the BE, the app increases
  the interval of polling time to 20 seconds and when the app is in the foreground, the interval of polling time is 7
  seconds.
- The Odds are randomly generated and updated every 15 seconds with python-flask framework, and it is hosted in GCP.
- Isolates are used to handle polling task to avoid blocking the main thread.
- The app is tested on Android and iOS devices.
- The app is tested on Android and iOS emulators.
- The app is not tested on The web
- Email validation is done using regex. and the unit test is written for the email validation function.
- Widget test is written for LoginField.
- Since it is a POC, Localisation is not implemented.
- To have clean and readable code, linting turned on and used. `analysis_options.yaml` file is used to configure the
  linting rules.
