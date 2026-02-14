#!/bin/bash
set -e

echo "Installing Flutter..."

git clone https://github.com/flutter/flutter.git --depth 1 -b stable
export PATH="$PATH:`pwd`/flutter/bin"

flutter --version

echo "Enable web..."
flutter config --enable-web

echo "Get packages..."
flutter pub get

echo "Build web..."
flutter build web --release
