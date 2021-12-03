## Generate apk options
flutter build apk --debug --flavor flavour_1 -t lib/src/uy/com/vberazategui/shared/presentation/flavour/flavour_1/main.dev.dart --no-shrink
flutter build apk --release --flavor flavour_1 -t lib/src/uy/com/vberazategui/shared/presentation/flavour/flavour_1/main.dev.dart --no-shrink
Entry points:
- main.dev
- main.test
- main.prod
Flavours:
- flavour_1
- flavour_2