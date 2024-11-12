# shellcheck disable=SC2044
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs