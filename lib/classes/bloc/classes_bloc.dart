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
    on<ClassesLoaded>((final event, final _) async {
      await _classesSubscription?.cancel();
      _classesSubscription =
          classesRepository.classes(event.tagEnum).listen((final classes) => add(ClassesUpdated(classes)));
    });
    on<ClassesUpdated>((final event, final emit) => emit(ClassesLoadSuccess(event.classes)));
  }

  final TagCubit tagCubit;
  final ClassesRepository classesRepository;
  StreamSubscription? _tagSubscription;
  StreamSubscription? _classesSubscription;

  @override
  Future<void> close() {
    _classesSubscription?.cancel();
    _tagSubscription?.cancel();

    return super.close();
  }
}
