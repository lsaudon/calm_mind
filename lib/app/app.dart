import 'package:calm_mind/class_player/class_player.dart';
import 'package:calm_mind/classes/classes.dart';
import 'package:calm_mind/home/home.dart';
import 'package:calm_mind/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:calm_mind/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ClassesRepository(),
      child: BlocProvider(
        create: (context) => ClassPlayerBloc(),
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
