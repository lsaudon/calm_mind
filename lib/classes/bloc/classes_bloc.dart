import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calm_mind/classes/classes.dart';

class ClassesBloc extends Bloc<ClassesEvent, ClassesState> {
  ClassesBloc({
    required this.tagCubit,
    required this.classesRepository,
  }) : super(ClassesInitial()) {
    _tagSubscription = tagCubit.stream.listen((event) {
      add(ClassesLoaded(event));
    });
  }

  final TagCubit tagCubit;
  final ClassesRepository classesRepository;
  StreamSubscription? _tagSubscription;
  StreamSubscription? _classesSubscription;

  @override
  Stream<ClassesState> mapEventToState(ClassesEvent event) async* {
    if (event is ClassesLoaded) {
      yield* _mapClassesLoadedToState(event);
    } else if (event is ClassesUpdated) {
      yield* _mapClassesUpdatedToState(event);
    }
  }

  Stream<ClassesState> _mapClassesLoadedToState(ClassesLoaded event) async* {
    await _classesSubscription?.cancel();
    _classesSubscription = classesRepository.classes(event.tagEnum).listen((classes) => add(ClassesUpdated(classes)));
  }

  Stream<ClassesState> _mapClassesUpdatedToState(ClassesUpdated event) async* {
    yield ClassesLoadSuccess(event.classes);
  }

  @override
  Future<void> close() {
    _classesSubscription?.cancel();
    _tagSubscription?.cancel();
    return super.close();
  }
}
