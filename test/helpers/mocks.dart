import 'package:bloc_test/bloc_test.dart';
import 'package:calm_mind/classes/bloc/classes_bloc.dart';
import 'package:calm_mind/classes/bloc/classes_event.dart';
import 'package:calm_mind/classes/bloc/classes_state.dart';
import 'package:calm_mind/classes/cubit/tag_cubit.dart';
import 'package:calm_mind/classes/models/tag_enum.dart';
import 'package:calm_mind/classes/repository/classes_repository.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockClassesRepository extends Mock implements ClassesRepository {}

class MockClassesBloc extends MockBloc<ClassesEvent, ClassesState>
    implements ClassesBloc {}

class MockTagCubit extends MockCubit<TagEnum> implements TagCubit {}
