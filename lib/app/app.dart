import 'package:calm_mind/class_player/bloc/class_player_bloc.dart';
import 'package:calm_mind/classes/repository/classes_repository.dart';
import 'package:calm_mind/home/view/home_page.dart';
import 'package:calm_mind/l10n/l10n.dart';
import 'package:calm_mind/themes/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(final BuildContext context) => RepositoryProvider(
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
