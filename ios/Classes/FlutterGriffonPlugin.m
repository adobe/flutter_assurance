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

#import "FlutterGriffonPlugin.h"
#import "ACPGriffon.h"
#import "ACPGriffonEvent.h"
#import "ACPCore.h"

@implementation FlutterGriffonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_griffon"
            binaryMessenger:[registrar messenger]];
  FlutterGriffonPlugin* instance = [[FlutterGriffonPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"extensionVersion" isEqualToString:call.method]) {
      result([ACPGriffon extensionVersion]);
  } else if ([@"startSession" isEqualToString:call.method]) {
      NSString *url = (NSString *) call.arguments;
      [ACPGriffon startSession:[NSURL URLWithString: url]];
      result(nil);
  } else if ([@"endSession" isEqualToString:call.method]) {
      [ACPGriffon endSession];
      result(nil);
  } else if ([@"sendEvent" isEqualToString:call.method]) {
      [self handleSendEventCall:call result:result];
  } else if ([@"attemptReconnect" isEqualToString:call.method]) {
      [ACPGriffon attemptReconnect];
      result(nil);
  }  else if ([@"logLocalUILevel" isEqualToString:call.method]) {
      [self handleLogLocalUILevel:call result:result];
   } else {
      result(FlutterMethodNotImplemented);
  }
}

- (void) handleSendEventCall:(FlutterMethodCall *) call result:(FlutterResult)result {
    NSDictionary *dict = (NSDictionary *) call.arguments;
    NSString *vendor = (NSString *) dict[@"vendor"];
    NSString *type = (NSString *) dict[@"type"];
    NSDictionary *payload = (NSDictionary *) dict[@"payload"];

    ACPGriffonEvent* event = [[ACPGriffonEvent alloc] initWithVendor:vendor type:type payload:payload];
    [ACPGriffon sendEvent:event];
    result(nil);
}

- (void)handleLogLocalUILevel:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSString *logColorStr = call.arguments[@"level"];
    NSString *message = call.arguments[@"message"];
    
    [ACPGriffon logLocalUILevel:[self logColorFromString:logColorStr] message:message];
    result(nil);
}

// Helper methods
- (ACPGriffonUILogColor) logColorFromString:(NSString *)logColorStr {
    if ([logColorStr isEqualToString:@"ACPGRIFFON_UI_LOG_COLOR_LOW"]) {
        return ACPGriffonUILogVisibilityLow;
    } else if([logColorStr isEqualToString:@"ACPGRIFFON_UI_LOG_COLOR_NORMAL"]) {
        return ACPGriffonUILogVisibilityNormal;
    } else if([logColorStr isEqualToString:@"ACPGRIFFON_UI_LOG_COLOR_HIGH"]) {
        return ACPGriffonUILogVisibilityHigh;
    } else if([logColorStr isEqualToString:@"ACPGRIFFON_UI_LOG_COLOR_CRITICAL"]) {
        return ACPGriffonUILogVisibilityCritical;
    }
    
    // Default to normal
    [ACPCore log:ACPMobileLogLevelWarning tag:@"FlutterGriffonPlugin"
         message:[NSString stringWithFormat:@"Warning: Could not convert UI log color (%@). Defaulting to normal.", logColorStr]];
    return ACPGriffonUILogVisibilityNormal;
}

@end
