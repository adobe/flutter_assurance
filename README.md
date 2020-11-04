# flutter_griffon

## ⚠️ This package is DEPRECATED. Please use [flutter_assurance](https://pub.dev/packages/flutter_assurance).

[![pub package](https://img.shields.io/pub/v/flutter_griffon.svg)](https://pub.dartlang.org/packages/flutter_griffon) ![Build](https://github.com/adobe/flutter_acpanalytics/workflows/Dart%20Unit%20Tests%20+%20Android%20Build%20+%20iOS%20Build/badge.svg) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

`flutter_griffon` is a flutter plugin for the iOS and Android [Project Griffon SDK](https://aep-sdks.gitbook.io/docs/beta/project-griffon) to allow for integration with Flutter applications. Functionality to enable the Griffon extension is provided entirely through Dart documented below.

## Installation

Install instructions for this package can be found [here](https://pub.dev/packages/flutter_griffon#-installing-tab-).

> Note: After you have installed the SDK, don't forget to run `pod install` in your `ios` directory to link the libraries to your Xcode project.

## Tests

Run:

```bash
flutter test
```

## Usage
### [Griffon](https://aep-sdks.gitbook.io/docs/beta/project-griffon)

##### Registering the extension with ACPCore:

 > Note: It is required to initialize the SDK via native code inside your AppDelegate and MainApplication for iOS and Android respectively. For more information see how to initialize [Core](https://aep-sdks.gitbook.io/docs/getting-started/initialize-the-sdk).

 ##### **iOS**
Swift
 ```swift
import ACPGriffon

ACPGriffon.registerExtension()
 ```
Objective-C
 ```objective-c
#import "ACPGriffon.h"

[ACPGriffon registerExtension];
 ```

 ##### **Android:**
 ```java
import com.adobe.marketing.mobile.Griffon;

Griffon.registerExtension();
 ```

##### Importing the SDK:
```dart
import 'package:flutter_griffon/flutter_griffon.dart';
```

##### Getting Griffon version:
 ```dart
String version = await FlutterGriffon.extensionVersion;
 ```

##### Starting a Griffon session:
 ```dart
FlutterGriffon.startSession(url);
 ```


## Contributing
See [CONTRIBUTING](CONTRIBUTING.md)

## License
See [LICENSE](LICENSE)
