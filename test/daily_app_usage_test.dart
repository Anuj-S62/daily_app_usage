import 'package:flutter_test/flutter_test.dart';
import 'package:daily_app_usage/daily_app_usage.dart';
import 'package:daily_app_usage/daily_app_usage_platform_interface.dart';
import 'package:daily_app_usage/daily_app_usage_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDailyAppUsagePlatform
    with MockPlatformInterfaceMixin
    implements DailyAppUsagePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DailyAppUsagePlatform initialPlatform = DailyAppUsagePlatform.instance;

  test('$MethodChannelDailyAppUsage is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDailyAppUsage>());
  });

  test('getPlatformVersion', () async {
    DailyAppUsage dailyAppUsagePlugin = DailyAppUsage();
    MockDailyAppUsagePlatform fakePlatform = MockDailyAppUsagePlatform();
    DailyAppUsagePlatform.instance = fakePlatform;

    expect(await dailyAppUsagePlugin.getPlatformVersion(), '42');
  });
}
