import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:calm_mind/app/app_bloc_observer.dart';
import 'package:flutter/widgets.dart';

// Ignored for some reasons
// ignore: prefer-static-class
Future<void> bootstrap(final FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (final details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

  await runZonedGuarded(
    () async => runZoned(() async => runApp(await builder())),
    (final error, final stackTrace) =>
        log(error.toString(), stackTrace: stackTrace),
  );
}
