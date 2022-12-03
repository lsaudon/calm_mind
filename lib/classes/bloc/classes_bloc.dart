import 'dart:async';

import 'package:calm_mind/classes/bloc/classes_event.dart';
import 'package:calm_mind/classes/bloc/classes_state.dart';
import 'package:calm_mind/classes/cubit/tag_cubit.dart';
import 'package:calm_mind/classes/models/class_for_list.dart';
import 'package:calm_mind/classes/models/tag_enum.dart';
import 'package:calm_mind/classes/repository/classes_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassesBloc extends Bloc<ClassesEvent, ClassesState> {
  ClassesBloc({
    required this.tagCubit,
    required this.classesRepository,
  }) : super(ClassesInitial()) {
    _tagSubscription = tagCubit.stream.listen((final event) {
      add(ClassesLoaded(event));
    });
    on<ClassesLoaded>((final event, final _) {
      unawaited(_classesSubscription?.cancel());
      _classesSubscription = classesRepository
          .classes(event.tagEnum)
          .listen((final classes) => add(ClassesUpdated(classes)));
    });
    on<ClassesUpdated>(
      (final event, final emit) => emit(ClassesLoadSuccess(event.classes)),
    );
  }

  final ClassesRepository classesRepository;
  final TagCubit tagCubit;
  StreamSubscription<TagEnum>? _tagSubscription;
  StreamSubscription<List<ClassForList>>? _classesSubscription;

  @override
  Future<void> close() {
    _classesSubscription?.cancel();
    _tagSubscription?.cancel();

    return super.close();
  }
}
