import 'package:calm_mind/classes/bloc/classes_bloc.dart';
import 'package:calm_mind/classes/bloc/classes_event.dart';
import 'package:calm_mind/classes/cubit/tag_cubit.dart';
import 'package:calm_mind/classes/models/tag_enum.dart';
import 'package:calm_mind/classes/repository/classes_repository.dart';
import 'package:calm_mind/classes/view/classes_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassesPage extends StatelessWidget {
  const ClassesPage({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider(
        create: (final context) => TagCubit(),
        child: Builder(
          builder: (final context) => BlocProvider(
            create: (final _) => ClassesBloc(
              tagCubit: BlocProvider.of<TagCubit>(context),
              classesRepository:
                  RepositoryProvider.of<ClassesRepository>(context),
            )..add(const ClassesLoaded(TagEnum.none)),
            child: const ClassesView(),
          ),
        ),
      );
}
