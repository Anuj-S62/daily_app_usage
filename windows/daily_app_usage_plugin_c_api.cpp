#include "include/daily_app_usage/daily_app_usage_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "daily_app_usage_plugin.h"

void DailyAppUsagePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  daily_app_usage::DailyAppUsagePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
