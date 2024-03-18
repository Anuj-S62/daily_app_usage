
import 'dart:ffi';
import 'dart:io' show Platform;
import 'package:flutter/services.dart';

import 'daily_app_usage_platform_interface.dart';

class DailyAppUsageException implements Exception {
  String _cause;

  DailyAppUsageException(this._cause);

  @override
  String toString() => _cause;
}

class DailyAppUsageInfo{
  late String packageName;
  late int timeInForeground;

  DailyAppUsageInfo(String packageName, int timeInForeground){
    this.packageName = packageName;
    this.timeInForeground = timeInForeground;
  }

String getPackageName(){
    return packageName;
  }
  int getTimeInForeground(){
    return timeInForeground;
  }

  int getHours(){
    return timeInForeground ~/ 3600000;
  }
  int getMinutes(){
    return (timeInForeground % 3600000) ~/ 60000;
  }
  int getSeconds(){
    return ((timeInForeground % 3600000) % 60000) ~/ 1000;
  }



  String toString(){
    return "Package Name: $packageName, Time in Foreground: $timeInForeground";
  }

}


class DailyAppUsage {
  static const MethodChannel _channel = MethodChannel("daily_app_usage.methodChannel");

  static final DailyAppUsage _instance = DailyAppUsage._();
  DailyAppUsage._();
  factory DailyAppUsage() => _instance;

  Future<List<DailyAppUsageInfo>> getDailyAppUsage() async {
    if (Platform.isAndroid) {
      Map usage = await _channel.invokeMethod('getTodayUsage');
      print(usage);
      List<DailyAppUsageInfo> dailyAppUsageInfo = [];
      usage.forEach((key, value) {

        dailyAppUsageInfo.add(DailyAppUsageInfo(key, value));
      });
      return dailyAppUsageInfo;
    } else {
      throw DailyAppUsageException("This plugin is only supported on Android.");
    }
  }
  // static const MethodChannel _channel = MethodChannel("running_app.methodChannel");
  //
  // static final DailyAppUsage _instance = DailyAppUsage._();
  // DailyAppUsage._();
  // factory DailyAppUsage() => _instance;
  //
  // Future<String> getRunningApp() async {
  //   if (Platform.isAndroid) {
  //     return await _channel.invokeMethod('getRunningApp');
  //   } else {
  //     throw ForegroundRunningAppException("This plugin is only supported on Android.");
  //   }
  // }


}
