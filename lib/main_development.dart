import 'package:bloc/bloc.dart';
import 'package:calm_mind/app/app.dart';
import 'package:calm_mind/app/app_bloc_observer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: AppBlocObserver(),
  );
}
