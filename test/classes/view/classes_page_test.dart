// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:calm_mind/classes/classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../helpers/helpers.dart';

class MockClassesBloc extends MockBloc<ClassesEvent, ClassesState> implements ClassesBloc {}

void main() {
  group('CounterPage', () {
    testWidgets('renders ClassesView', (tester) async {
      await tester.pumpApp(const ClassesPage());
      expect(find.byType(ClassesView), findsOneWidget);
    });
  });

  group('ClassesView', () {
    testWidgets('renders ClassesLoading', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: MockClassesBloc(),
          child: const ClassesView(),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
