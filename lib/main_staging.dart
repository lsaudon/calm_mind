import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:calm_mind/app/app.dart';
import 'package:calm_mind/app/app_bloc_observer.dart';
import 'package:flutter/widgets.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (final details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () => runApp(const App()),
    (final error, final stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
