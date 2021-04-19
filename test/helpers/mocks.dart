import 'package:bloc_test/bloc_test.dart';
import 'package:calm_mind/classes/classes.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockClassesRepository extends Mock implements ClassesRepository {}

class MockClassesBloc extends MockBloc<ClassesEvent, ClassesState> implements ClassesBloc {}
