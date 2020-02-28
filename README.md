# flutter_griffon

[![pub package](https://img.shields.io/pub/v/flutter_griffon.svg)](https://pub.dartlang.org/packages/flutter_griffon) ![Build](https://github.com/adobe/flutter_acpanalytics/workflows/Dart%20Unit%20Tests%20+%20Android%20Build%20+%20iOS%20Build/badge.svg) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

⚠️ This package is currently in beta, we are actively working to a release candidate. If you have any feedback please log an issue or submit a pull request.

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

##### Ending a Griffon session:
```dart
FlutterGriffon.endSession();
```

##### Attempt to reconnect to a Griffon session:
```dart
FlutterGriffon.attemptReconnect();
```

##### Sending a Griffon event:
```dart
FlutterGriffon.sendEvent("vendor", "type", {"customPayload": "customValue"});
```

##### Log Local UI Level:
```dart
import 'package:flutter_griffon/src/acpgriffon_uilogcolor.dart';

FlutterGriffon.logLocalUILevel(ACPGriffonUILogColor.VISIBILITY_LOW, "message");
FlutterGriffon.logLocalUILevel(ACPGriffonUILogColor.VISIBILITY_NORMAL, "message");
FlutterGriffon.logLocalUILevel(ACPGriffonUILogColor.VISIBILITY_HIGH, "message");
FlutterGriffon.logLocalUILevel(ACPGriffonUILogColor.VISIBILITY_CRITICAL, "message");
```

## Contributing
See [CONTRIBUTING](CONTRIBUTING.md)

## License
See [LICENSE](LICENSE)
