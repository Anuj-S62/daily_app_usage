//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <daily_app_usage/daily_app_usage_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) daily_app_usage_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "DailyAppUsagePlugin");
  daily_app_usage_plugin_register_with_registrar(daily_app_usage_registrar);
}
