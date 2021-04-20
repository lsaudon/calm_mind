import 'package:calm_mind/classes/classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calm_mind/l10n/l10n.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget,
      {NavigatorObserver? navigatorObserver,
      ClassesRepository? classesRepository}) {
    Widget aWidget = MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorObservers: navigatorObserver != null ? [navigatorObserver] : [],
      home: widget,
    );
    if (classesRepository != null) {
      aWidget = RepositoryProvider(
          create: (context) => classesRepository, child: aWidget);
    }
    return pumpWidget(aWidget);
  }
}
