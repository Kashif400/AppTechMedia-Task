#!/bin/bash

set -e

function menu() {
  echo "Select an option to run (enter the index number):"
  echo "  1) Run Development"
  echo "  2) Run Production"
  echo "  3) Run Test"
  echo "  4) Build APK Development"
  echo "  5) Build APK Production"
  echo "  6) Build APK Test"
  echo "  7) Build iOS Development"
  echo "  8) Build iOS Production"
  echo "  9) Build iOS Test"
  echo " 10) Run Codegen (build_runner)"
  echo "  0) Exit"
}

menu
read -p "Enter your choice [0-9]: " choice

# If SKIP_CODEGEN=1 is set, skip code generation.
if [ "${SKIP_CODEGEN:-0}" != "1" ]; then
  # If user explicitly chose codegen, only run codegen and exit.
  if [ "$choice" = "10" ]; then
    echo "Running code generation (only): flutter pub run build_runner build --delete-conflicting-outputs"
    flutter pub run build_runner build --delete-conflicting-outputs
    exit $?
  fi

else
  echo "SKIP_CODEGEN=1 detected — skipping code generation step"
fi

case $choice in
  1)
    flutter run --flavor dev -t lib/main_dev.dart
    ;;
  2)
    flutter run --flavor prod -t lib/main_prod.dart
    ;;
  3)
    flutter run --flavor test -t lib/main_test.dart
    ;;
  4)
    flutter build apk --flavor dev -t lib/main_dev.dart
    ;;
  5)
    flutter build apk --flavor prod -t lib/main_prod.dart
    ;;
  6)
    flutter build apk --flavor test -t lib/main_test.dart
    ;;
  7)
    flutter build ios --flavor dev -t lib/main_dev.dart
    ;;
  8)
    flutter build ios --flavor prod -t lib/main_prod.dart
    ;;
  9)
    flutter build ios --flavor test -t lib/main_test.dart
    ;;
  0)
    echo "Exiting."
    exit 0
    ;;
  *)
    echo "Invalid option. Exiting."
    exit 1
    ;;
esac