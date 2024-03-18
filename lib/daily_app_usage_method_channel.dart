import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'daily_app_usage_platform_interface.dart';

/// An implementation of [DailyAppUsagePlatform] that uses method channels.
class MethodChannelDailyAppUsage extends DailyAppUsagePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('daily_app_usage');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
