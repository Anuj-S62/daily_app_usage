#ifndef FLUTTER_PLUGIN_DAILY_APP_USAGE_PLUGIN_H_
#define FLUTTER_PLUGIN_DAILY_APP_USAGE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace daily_app_usage {

class DailyAppUsagePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  DailyAppUsagePlugin();

  virtual ~DailyAppUsagePlugin();

  // Disallow copy and assign.
  DailyAppUsagePlugin(const DailyAppUsagePlugin&) = delete;
  DailyAppUsagePlugin& operator=(const DailyAppUsagePlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace daily_app_usage

#endif  // FLUTTER_PLUGIN_DAILY_APP_USAGE_PLUGIN_H_
