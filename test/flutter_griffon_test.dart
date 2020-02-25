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

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_griffon/flutter_griffon.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_griffon/src/acpgriffon_uilogcolor.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_griffon');

  TestWidgetsFlutterBinding.ensureInitialized();

  group('extensionVersion', () {
    final String testVersion = "2.5.0";
    final List<MethodCall> log = <MethodCall>[];

    setUp(() {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        log.add(methodCall);
        return testVersion;
      });
    });

    test('invokes correct method', () async {
      await FlutterGriffon.extensionVersion;

      expect(log, <Matcher>[
        isMethodCall(
          'extensionVersion',
          arguments: null,
        ),
      ]);
    });

    test('returns correct result', () async {
      expect(await FlutterGriffon.extensionVersion, testVersion);
    });
  });

  group('startSession', () {
    final String testUrl = "adobe.com";
    final List<MethodCall> log = <MethodCall>[];

    setUp(() {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        log.add(methodCall);
        return null;
      });
    });

    test('invokes correct method', () async {
      await FlutterGriffon.startSession(testUrl);

      expect(log, <Matcher>[
        isMethodCall(
          'startSession',
          arguments: testUrl,
        ),
      ]);
    });
  });

  group('endSession', () {
    final List<MethodCall> log = <MethodCall>[];

    setUp(() {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        log.add(methodCall);
        return null;
      });
    });

    test('invokes correct method', () async {
      await FlutterGriffon.endSession();

      expect(log, <Matcher>[
        isMethodCall(
          'endSession',
          arguments: null,
        ),
      ]);
    });
  });

  group('attemptReconnect', () {
    final List<MethodCall> log = <MethodCall>[];

    setUp(() {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        log.add(methodCall);
        return null;
      });
    });

    test('invokes correct method', () async {
      await FlutterGriffon.attemptReconnect();

      expect(log, <Matcher>[
        isMethodCall(
          'attemptReconnect',
          arguments: null,
        ),
      ]);
    });
  });

  group('sendEvent', () {
    final String testVendor = "testVendor";
    final String testType = "testType";
    final Map testPayload = {"testKey": "testValue"};

    final List<MethodCall> log = <MethodCall>[];

    setUp(() {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        log.add(methodCall);
        return null;
      });
    });

    test('invokes correct method', () async {
      await FlutterGriffon.sendEvent(testVendor, testType, testPayload);

      expect(log, <Matcher>[
        isMethodCall(
          'sendEvent',
          arguments: {
            "vendor": testVendor,
            "type": testType,
            "payload": testPayload
          },
        ),
      ]);
    });
  });

  group('logLocalUILevel', () {
    final ACPGriffonUILogColor testLogColor =
        ACPGriffonUILogColor.VISIBILITY_LOW;
    final String testMessage = "testMessage";

    final List<MethodCall> log = <MethodCall>[];

    setUp(() {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        log.add(methodCall);
        return null;
      });
    });

    test('invokes correct method', () async {
      await FlutterGriffon.logLocalUILevel(testLogColor, testMessage);

      expect(log, <Matcher>[
        isMethodCall(
          'logLocalUILevel',
          arguments: {"level": testLogColor.value, "message": testMessage},
        ),
      ]);
    });
  });
}
