import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:daily_app_usage/daily_app_usage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<DailyAppUsageInfo> _usageStats = [];
  @override
  void initState() {
    super.initState();
  }

  // void getPackageName() async {
  //   String packageName;
  //   try {
  //     packageName = await DailyAppUsage().getDailyAppUsage();
  //   } on PlatformException {
  //     packageName = 'Failed to get package name.';
  //   }
  //   if (!mounted) return;
  //
  //   setState(() {
  //     _packageName = packageName;
  //   });
  // }

  void getUsageStats() async{
    List<DailyAppUsageInfo> usageStats;
    try {
      usageStats = await DailyAppUsage().getDailyAppUsage();
    } on PlatformException {
      usageStats = [];
    }
    if (!mounted) return;

    setState(() {
      _usageStats = usageStats;
      print(_usageStats);
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: _usageStats.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(_usageStats[index].getPackageName()),
                subtitle: Text(_usageStats[index].getHours().toString() + " : " + _usageStats[index].getMinutes().toString() + " : " + _usageStats[index].getSeconds().toString()),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            getUsageStats();
          },
          child: const Icon(Icons.add),
        ),
      ),
      //  add a floating action button

    );
  }
}
