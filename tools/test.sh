## Testing options
### Running the app from test
dart test_driver/bdd_test.dart (environment.dev)
### Running test remotely
#### As you make changes in the app under test, just R (reload). In the test window you
#### can rerun the tests and update the Scenarios quickly and easily.
For the app -> flutter run --flavor flavour_1 -t lib/src/uy/com/vberazategui/shared/presentation/flavour/flavour_1/main.test.dart --verbose (copy 'Connecting to service protocol' URL)
For the tests --> dart test_driver/bdd_test.dart http://127.0.0.1:63034/fPkqMbf3YVY=/