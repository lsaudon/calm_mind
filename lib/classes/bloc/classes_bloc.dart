import 'dart:async';

import 'package:calm_mind/classes/classes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassesBloc extends Bloc<ClassesEvent, ClassesState> {
  ClassesBloc({
    required final this.tagCubit,
    required final this.classesRepository,
  }) : super(ClassesInitial()) {
    _tagSubscription = tagCubit.stream.listen((final event) {
      add(ClassesLoaded(event));
    });
  }

  final TagCubit tagCubit;
  final ClassesRepository classesRepository;
  StreamSubscription? _tagSubscription;
  StreamSubscription? _classesSubscription;

  @override
  Stream<ClassesState> mapEventToState(final ClassesEvent event) async* {
    if (event is ClassesLoaded) {
      yield* _mapClassesLoadedToState(event);
    } else if (event is ClassesUpdated) {
      yield* _mapClassesUpdatedToState(event);
    }
  }

  Stream<ClassesState> _mapClassesLoadedToState(final ClassesLoaded event) async* {
    await _classesSubscription?.cancel();
    _classesSubscription =
        classesRepository.classes(event.tagEnum).listen((final classes) => add(ClassesUpdated(classes)));
  }

  Stream<ClassesState> _mapClassesUpdatedToState(final ClassesUpdated event) async* {
    yield ClassesLoadSuccess(event.classes);
  }

  @override
  Future<void> close() {
    _classesSubscription?.cancel();
    _tagSubscription?.cancel();
    return super.close();
  }
}
