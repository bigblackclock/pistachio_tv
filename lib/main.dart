import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:pistachio_tv/app/app.dart';
import 'package:pistachio_tv/app/app_bloc_observer.dart';
import 'package:pistachio_tv/models/models.dart';

Future<void> main() async {
  await Parse().initialize(
    'tL1avnxZkMIruFAFF9qNC2zcYxUs0k4WzN8LObK6',
    'https://parseapi.back4app.com/',
    debug: true,
    clientKey: 'wgcqCXLCY5r8eqaXoBvSzHH9tlYeXdKbPykgDD0d',
    registeredSubClassMap: <String, ParseObjectConstructor>{
      'Channels': () => Channel(),
    },
  );
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  // ParseCoreData().registerSubClass('Channels', () => Channel());

  runZonedGuarded(
    () => runApp(const App()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
