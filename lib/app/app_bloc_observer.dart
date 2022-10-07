import 'dart:developer';

import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(final BlocBase<dynamic> bloc, final Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(
    final BlocBase<dynamic> bloc,
    final Object error,
    final StackTrace stackTrace,
  ) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}
