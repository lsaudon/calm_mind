import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calm_mind/classes/classes.dart';

class ClassesBloc extends Bloc<ClassesEvent, ClassesState> {
  ClassesBloc({
    required this.tagCubit,
    required this.classesRepository,
  }) : super(ClassesLoading()) {
    _tagSubscription = tagCubit.stream.listen((event) {
      add(LoadClasses(event));
    });
  }

  final TagCubit tagCubit;
  final ClassesRepository classesRepository;
  StreamSubscription? _tagSubscription;
  StreamSubscription? _classesSubscription;

  @override
  Stream<ClassesState> mapEventToState(ClassesEvent event) async* {
    if (event is LoadClasses) {
      yield* _mapClassesLoadedToState(event);
    } else if (event is ClassesUpdated) {
      yield* _mapTodosUpdateToState(event);
    }
  }

  Stream<ClassesState> _mapClassesLoadedToState(LoadClasses event) async* {
    await _classesSubscription?.cancel();
    _classesSubscription = classesRepository.classes(event.tagEnum).listen((classes) => add(ClassesUpdated(classes)));
  }

  Stream<ClassesState> _mapTodosUpdateToState(ClassesUpdated event) async* {
    yield ClassesLoaded(event.classes);
  }

  @override
  Future<void> close() {
    _classesSubscription?.cancel();
    _tagSubscription?.cancel();
    return super.close();
  }
}
