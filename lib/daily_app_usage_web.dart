// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'daily_app_usage_platform_interface.dart';

/// A web implementation of the DailyAppUsagePlatform of the DailyAppUsage plugin.
class DailyAppUsageWeb extends DailyAppUsagePlatform {
  /// Constructs a DailyAppUsageWeb
  DailyAppUsageWeb();

  static void registerWith(Registrar registrar) {
    DailyAppUsagePlatform.instance = DailyAppUsageWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }
}
