# shellcheck disable=SC2044
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html