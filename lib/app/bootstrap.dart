import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:calm_mind/app/app_bloc_observer.dart';
import 'package:flutter/widgets.dart';

Future<void> bootstrap(final FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (final details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(await builder()),
        blocObserver: AppBlocObserver(),
      );
    },
    (final error, final stackTrace) =>
        log(error.toString(), stackTrace: stackTrace),
  );
}
