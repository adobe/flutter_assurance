/*
Copyright 2020 Adobe. All rights reserved.
This file is licensed to you under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License. You may obtain a copy
of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under
the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
OF ANY KIND, either express or implied. See the License for the specific language
governing permissions and limitations under the License.
*/

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_griffon/src/acpgriffon_uilogcolor.dart';

/// Adobe Experience Platform Griffon API.
class FlutterGriffon {
  static const MethodChannel _channel = const MethodChannel('flutter_griffon');

  /// Gets the current Griffon extension version.
  static Future<String> get extensionVersion async {
    final String version = await _channel.invokeMethod('extensionVersion');
    return version;
  }

  /// Starts a Project Griffon session.
  static Future<void> startSession(String url) {
    return _channel.invokeMethod('startSession', url ?? "");
  }

  /// Ends an active Project Griffon session.
  static Future<void> endSession() {
    return _channel.invokeMethod('endSession');
  }

  /// Attempts to reconnect to an already running Project Griffon session.
  static Future<void> attemptReconnect() {
    return _channel.invokeMethod('attemptReconnect');
  }

  /// Send a message to the Project Griffon Service.
  static Future<void> sendEvent(String vendor, String type, Map payload) {
    return _channel.invokeMethod('sendEvent',
        {'vendor': vendor ?? "", 'type': type ?? "", 'payload': payload ?? {}});
  }

  /// Displays a log message in the local-client UI interface.
  static Future<void> logLocalUILevel(ACPGriffonUILogColor level, String message) {
  return _channel.invokeMethod(
        'logLocalUILevel', {"level": level.value, "message": message ?? ""});
  }
}
