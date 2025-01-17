#!/bin/bash

set -e

echo "Deleting existing build folder..."
rm -rf './build'

echo "Archiving for iOS..."
     xcodebuild archive \
          -scheme MyXC \
          -destination "generic/platform=iOS" \
          -archivePath './build/MyXC.framework-iphoneos.xcarchive' \
          SKIP_INSTALL=NO \
          BUILD_LIBRARY_FOR_DISTRIBUTION=YES

echo "Archiving for iOS Simulator..."
        xcodebuild archive \
          -scheme MyXC \
          -destination "generic/platform=iOS Simulator" \
          -archivePath './build/MyXC.framework-iphonesimulator.xcarchive' \
          SKIP_INSTALL=NO \
          BUILD_LIBRARY_FOR_DISTRIBUTION=YES

echo "Creating XCFramework..."
        xcodebuild -create-xcframework \
          -framework './build/MyXC.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/MyXC.framework' \
          -framework './build/MyXC.framework-iphoneos.xcarchive/Products/Library/Frameworks/MyXC.framework' \
          -output './build/MyXC.xcframework'

echo "Creating ZIP archive of the XCFramework..."
zip -r './build/MyXC.xcframework.zip' './build/MyXC.xcframework'
