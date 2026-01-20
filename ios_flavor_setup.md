# iOS Flavor Setup Instructions

To set up iOS flavors properly, you need to configure schemes in Xcode:

## Step 1: Open Xcode
1. Open `ios/Runner.xcworkspace` in Xcode
2. Select the Runner project in the navigator

## Step 2: Create Schemes
1. In Xcode, go to Product > Scheme > Manage Schemes...
2. Duplicate the existing Runner scheme 3 times
3. Rename them to:
   - `dev`
   - `prod` 
   - `test`

## Step 3: Configure Build Settings
For each scheme:

### Dev Scheme:
- Edit Scheme > Build > Pre-actions
- Add New Run Script Action:
  ```bash
  echo "FLUTTER_TARGET=lib/main_dev.dart" > ${SRCROOT}/Flutter/Generated.xcconfig
  echo "FLUTTER_BUILD_MODE=debug" >> ${SRCROOT}/Flutter/Generated.xcconfig
  ```

### Prod Scheme:
- Edit Scheme > Build > Pre-actions  
- Add New Run Script Action:
  ```bash
  echo "FLUTTER_TARGET=lib/main_prod.dart" > ${SRCROOT}/Flutter/Generated.xcconfig
  echo "FLUTTER_BUILD_MODE=release" >> ${SRCROOT}/Flutter/Generated.xcconfig
  ```

### Test Scheme:
- Edit Scheme > Build > Pre-actions
- Add New Run Script Action:
  ```bash
  echo "FLUTTER_TARGET=lib/main_test.dart" > ${SRCROOT}/Flutter/Generated.xcconfig  
  echo "FLUTTER_BUILD_MODE=debug" >> ${SRCROOT}/Flutter/Generated.xcconfig
  ```

## Step 4: Update Info.plist
Add configuration-specific values to Info.plist:
```xml
<key>CFBundleDisplayName</key>
<string>$(PRODUCT_NAME)</string>
<key>CFBundleIdentifier</key>
<string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
```

## Step 5: Build Configuration Files
The following configuration files have been created:
- `ios/Flutter/Dev.xcconfig`
- `ios/Flutter/Prod.xcconfig` 
- `ios/Flutter/Test.xcconfig`

Make sure these are properly referenced in your Xcode project settings.
