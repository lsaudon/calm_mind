import 'package:calm_mind/class_player/class_player.dart';
import 'package:calm_mind/classes/classes.dart';
import 'package:calm_mind/home/home.dart';
import 'package:calm_mind/l10n/l10n.dart';
import 'package:calm_mind/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return RepositoryProvider(
      create: (final context) => ClassesRepository(),
      child: BlocProvider(
        create: (final context) => ClassPlayerBloc(),
        child: MaterialApp(
          theme: CalmMindThemeData.lightThemeData,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: const HomePage(),
        ),
      ),
    );
  }
}
