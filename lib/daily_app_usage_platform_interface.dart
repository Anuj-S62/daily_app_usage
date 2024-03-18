import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'daily_app_usage_method_channel.dart';

abstract class DailyAppUsagePlatform extends PlatformInterface {
  /// Constructs a DailyAppUsagePlatform.
  DailyAppUsagePlatform() : super(token: _token);

  static final Object _token = Object();

  static DailyAppUsagePlatform _instance = MethodChannelDailyAppUsage();

  /// The default instance of [DailyAppUsagePlatform] to use.
  ///
  /// Defaults to [MethodChannelDailyAppUsage].
  static DailyAppUsagePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DailyAppUsagePlatform] when
  /// they register themselves.
  static set instance(DailyAppUsagePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
