//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <android_alarm_manager/AndroidAlarmManagerPlugin.h>
#import <audioplayers/AudioplayersPlugin.h>
#import <path_provider/PathProviderPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTAndroidAlarmManagerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTAndroidAlarmManagerPlugin"]];
  [AudioplayersPlugin registerWithRegistrar:[registry registrarForPlugin:@"AudioplayersPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
}

@end
